import 'package:adaptive_theme/src/sample_feature/item_tile.dart';
import 'package:adaptive_theme/src/themes/item_tile_theme.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    Key? key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  }) : super(key: key);

  static const routeName = '/';

  final List<SampleItem> items;

  ItemTileThemeData _responsiveData(BuildContext context) {
    final media = MediaQuery.of(context);
    final theme = Theme.of(context);
    final result = ItemTileThemeData.fallback(context);
    if (media.size.width > 420) {
      result.copyWith(
        titleStyle: theme.textTheme.headline5,
        captionStyle: theme.textTheme.bodyText1,
        imageSize: 84,
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return Builder(builder: (context) {
            return ItemTile(
                data: _responsiveData(context),
                image: 'assets/images/flutter_logo.png',
                title: 'SampleItem ${item.id}',
                caption: longText);
          });
        },
      ),
    );
  }
}

const String longText =
    "Navigate to the details page. If the user leaves and returns to the app after it has been killed while running in the background, the navigation stack is restored.";
