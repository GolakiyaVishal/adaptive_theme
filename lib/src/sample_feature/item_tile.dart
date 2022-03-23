import 'package:adaptive_theme/src/themes/item_tile_theme.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.data,
    required this.image,
    required this.title,
    required this.caption,
  }) : super(key: key);

  final ItemTileThemeData data;
  final String image;
  final String title;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 16.0),
          ]),
      child: Row(
        children: [
          Image.asset(
            image,
            height: data.imageSize,
            width: data.imageSize,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: data.titleStyle),
                Text(caption, style: data.captionStyle),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AdaptiveImage extends StatelessWidget {
  const AdaptiveImage({
    Key? key,
    required this.data,
    required this.image,
  }) : super(key: key);

  final ItemTileThemeData data;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Image.asset(
        image,
        height: data.imageSize,
        width: data.imageSize,
        fit: BoxFit.cover,
      );
    });
  }
}
