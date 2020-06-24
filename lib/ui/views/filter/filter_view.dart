import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../app/router.dart';
import '../../../constants/colors.dart';
import '../../../constants/cuisine_types.dart';
import '../../shared_widgets/custom_list_tile.dart';
import '../../shared_widgets/done_button.dart';

class FilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: Border(bottom: BorderSide(width: 0.1)),
        backgroundColor: ThemeColors.background,
        leading: CupertinoButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: () => Navigator.pop(context),
          child: Icon(
            CupertinoIcons.clear,
            size: 32,
          ),
        ),
        middle: Text(
          'Filters',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _UpperListTile(),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Cultural",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  for (String cuisine in Cuisine.types)
                    CustomListTile(
                      leading: Text(cuisine),
                      trailing: Icon(
                        Icons.crop_square,
                      ),
                    ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            DoneButton(),
          ],
        ),
      ),
    );
  }
}

class _UpperListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomListTile(
          onTap: () => Navigator.pushNamed(context, Routes.sortViewRoute),
          leading: Icon(Icons.sort),
          title: "Sort",
          subtitle: "Recommended",
          trailing: Icon(CupertinoIcons.right_chevron),
        ),
        CustomListTile(
          leading: Icon(Icons.sort),
          title: "Distance",
          trailing: Icon(CupertinoIcons.right_chevron),
        ),
        CustomListTile(
            leading: Icon(Icons.sort),
            title: "Open Now",
            trailing: PlatformSwitch(value: false, onChanged: (value) {})),
        const SizedBox(height: 40),
      ],
    );
  }
}
