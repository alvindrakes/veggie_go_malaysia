import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';

class LocationSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(150.w),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: ThemeColors.searchBar,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: Icon(Icons.search, color: ThemeColors.searchBarIcon),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 50.w),
            child: GestureDetector(
              child: Icon(
                Icons.near_me,
                color: ThemeColors.searchBarIcon,
              ),
              onTap: () {
                // TODO: switch to geolocation
              },
            ),
          ),
        ),
      ),
    );
  }
}
