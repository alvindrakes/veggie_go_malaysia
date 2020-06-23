import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Column(
            children: <Widget>[],
          ),
          DoneButton(),
        ],
      ),
    );
  }
}
