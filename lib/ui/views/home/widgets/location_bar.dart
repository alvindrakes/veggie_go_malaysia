import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/ui/views/home/home_viewmodel.dart';

class LocationSelector extends StatefulWidget {
  final HomeViewModel model;
  LocationSelector(this.model);

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: ThemeColors.searchBar,
        splashColor: Colors.white,
        onPressed: () => widget.model.navigateToSearch(),
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(width: 7),
                ),
                TextSpan(
                    text: 'Dishes, food types or places',
                    style: TextStyle(
                        fontFamily: 'Lato', color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
        ),
        textColor: Colors.black45,
      ),
    );
  }
}
