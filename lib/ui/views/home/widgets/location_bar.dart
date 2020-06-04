import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 125.h,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.h),
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
                  child: Icon(Icons.search, color: ThemeColors.searchBarIcon),
                ),
                WidgetSpan(
                  child: SizedBox(width: 15.w),
                ),
                TextSpan(
                    text: 'Search for places...',
                    style:
                        TextStyle(fontFamily: 'Lato', color: Colors.black45)),
              ],
            ),
          ),
        ),
        textColor: Colors.black45,
      ),
    );
  }
}

class FlagSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      // TODO: flag selector widget
      child: Image.asset('assets/images/MalaysiaFlag.png'),
    );
  }
}
