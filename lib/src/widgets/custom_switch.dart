import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));

    _animationController?.addListener(() {
      print('anim :: ${_animationController?.status}');
    });
  }

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 48.0;
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            // widget.value == false
            _circleAnimation!.value != Alignment.centerLeft
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: _circleAnimation!.value == Alignment.centerLeft
                      ? const Color(0xffe5e7f0)
                      : const Color(0xff128f79),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 3.0, bottom: 3.0, right: 3.0, left: 3.0),
                  child: Container(
                    alignment: _circleAnimation!.value,
                    // widget.value ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: (width - 6) / 2,
                      height: height - 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          shape: BoxShape.rectangle,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: TextStyle(
                    color: _circleAnimation!.value == Alignment.centerLeft
                        ? const Color(0x60242424)
                        : const Color(0xff128f79)),
              )
            ],
          ),
        );
      },
    );
  }
}
