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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withAlpha(isDark ? 77 : 26),
            blurRadius: 16.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              height: data.imageSize,
              width: data.imageSize,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      data.titleStyle?.copyWith(
                        color: theme.textTheme.titleLarge?.color,
                      ) ??
                      TextStyle(color: theme.textTheme.titleLarge?.color),
                ),
                const SizedBox(height: 4),
                Text(
                  caption,
                  style:
                      data.captionStyle?.copyWith(
                        color: theme.textTheme.bodyMedium?.color?.withAlpha(
                          179,
                        ),
                      ) ??
                      TextStyle(
                        color: theme.textTheme.bodyMedium?.color?.withAlpha(
                          179,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AdaptiveImage extends StatelessWidget {
  const AdaptiveImage({Key? key, required this.data, required this.image})
    : super(key: key);

  final ItemTileThemeData data;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            image,
            height: data.imageSize,
            width: data.imageSize,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
