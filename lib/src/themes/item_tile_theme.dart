import 'package:flutter/material.dart';

class ItemTileTheme extends InheritedWidget {
  const ItemTileTheme({
    required Widget child,
    required this.data,
    Key? key,
  }) : super(key: key, child: child);

  final ItemTileThemeData data;

  ItemTileThemeData of(BuildContext context) {
    return data;
  }

  @override
  bool updateShouldNotify(covariant ItemTileTheme oldWidget) {
    return data != oldWidget.data;
  }
}

abstract class ItemTileThemeData {
  TextStyle? titleStyle;
  TextStyle? captionStyle;
  double? imageSize;

  factory ItemTileThemeData() =>
      ItemTileThemeDataImpl();

  ItemTileThemeData copyWith({
    TextStyle? titleStyle,
    TextStyle? captionStyle,
    double? imageSize,
  });

  factory ItemTileThemeData.fallback(BuildContext context) {
    return ItemTileThemeDataImpl(
        titleStyle: Theme.of(context).textTheme.headline6,
        captionStyle: Theme.of(context).textTheme.caption,
        imageSize: 64);
  }
}

class ItemTileThemeDataImpl implements ItemTileThemeData {
  @override
  TextStyle? titleStyle;
  @override
  TextStyle? captionStyle;
  @override
  double? imageSize;

  ItemTileThemeDataImpl({
    this.titleStyle,
    this.captionStyle,
    this.imageSize,
  });

  @override
  ItemTileThemeData copyWith({
    TextStyle? titleStyle,
    TextStyle? captionStyle,
    double? imageSize,
  }) {
    this.titleStyle = titleStyle ?? this.titleStyle;
    this.captionStyle = captionStyle ?? this.captionStyle;
    this.imageSize = imageSize ?? this.imageSize;
    return this;
  }
}
