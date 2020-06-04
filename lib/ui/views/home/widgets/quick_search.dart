import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';

class QuickSearch extends StatelessWidget {
  static Widget _customIcon(Color color, String text, Image image) {
    return SizedBox(
      width: 220.w,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 80.w,
            child: image,
            backgroundColor: color,
          ),
          SizedBox(height: 10.h),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }

  final List<Widget> _quickIconsFirst = [
    _customIcon(ThemeColors.searchBarIcon, 'Japanese',
        Image.asset('assets/images/japanese_food.png')),
    _customIcon(ThemeColors.searchBarIcon, 'Chinese',
        Image.asset('assets/images/chinese_food.png')),
    _customIcon(ThemeColors.searchBarIcon, 'Western',
        Image.asset('assets/images/western_food.png')),
    _customIcon(ThemeColors.searchBarIcon, 'Indian',
        Image.asset('assets/images/indian_food.png')),
  ];
  final List<Widget> _quickIconsSecond = [
    _customIcon(ThemeColors.searchBarIcon, 'Korean',
        Image.asset('assets/images/korean_food.png')),
    _customIcon(ThemeColors.searchBarIcon, 'Thai',
        Image.asset('assets/images/thai_food.png')),
    _customIcon(ThemeColors.searchBarIcon, 'Mixed',
        Image.asset('assets/images/fusion_food.png')),
    _customIcon(ThemeColors.searchBarIcon, 'More', null),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _quickIconsFirst,
          ),
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _quickIconsSecond,
          )
        ],
      ),
    );
  }
}
