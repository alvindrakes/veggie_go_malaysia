import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggie_go_malaysia/ui/shared_widgets/custom_list_tile.dart';

import '../../constants/colors.dart';
import '../shared_widgets/done_button.dart';

class SortView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Filter',
        border: Border(bottom: BorderSide(width: 0.1)),
        backgroundColor: ThemeColors.background,
        middle: Text(
          'Filters',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: <Widget>[
                CustomListTile(
                  leading: Text('Distance'),
                  trailing: Icon(Icons.check_circle),
                ),
                CustomListTile(
                  leading: Text('Recommended'),
                  trailing: Icon(Icons.check_circle_outline),
                ),
                CustomListTile(
                  leading: Text('Top Rated'),
                  trailing: Icon(Icons.check_circle),
                ),
              ],
            ),
          ),
          DoneButton(),
        ],
      ),
    );
  }
}
