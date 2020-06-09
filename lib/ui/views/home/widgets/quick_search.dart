import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Lato'),
          ),
        ],
      ),
    );
  }

  final List<List<dynamic>> _quickIcons = [
    ['Japanese', Image.asset('assets/images/japanese_food.png')],
    ['Chinese', Image.asset('assets/images/chinese_food.png')],
    ['Western', Image.asset('assets/images/western_food.png')],
    ['Indian', Image.asset('assets/images/indian_food.png')],
    ['Thai', Image.asset('assets/images/thai_food.png')],
    ['Korean', Image.asset('assets/images/korean_food.png')],
    ['Mixed', Image.asset('assets/images/fusion_food.png')],
    ['More', null],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 230.h,
          child: ListView.builder(
            itemCount: _quickIcons.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _customIcon(
                  Colors.grey, _quickIcons[index][0], _quickIcons[index][1]);
            },
          ),
        ),
      ],
    );
  }
}
