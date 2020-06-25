import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class QuickSearch extends StatelessWidget {
  static Widget _customIcon(Color color, String text, Image image) {
    return SizedBox(
      width: 70,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            child: image,
            backgroundColor: color,
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontFamily: 'Lato', fontSize: 12),
          ),
        ],
      ),
    );
  }

  final List<List<dynamic>> _quickIcons = [
    ['quick_japanese'.tr(), Image.asset('assets/images/japanese_food.png')],
    ['quick_chinese'.tr(), Image.asset('assets/images/chinese_food.png')],
    ['quick_western'.tr(), Image.asset('assets/images/western_food.png')],
    ['quick_indian'.tr(), Image.asset('assets/images/indian_food.png')],
    ['quick_thai'.tr(), Image.asset('assets/images/thai_food.png')],
    ['quick_korean'.tr(), Image.asset('assets/images/korean_food.png')],
    ['quick_mixed'.tr(), Image.asset('assets/images/fusion_food.png')],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: _quickIcons.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _customIcon(
              Colors.grey, _quickIcons[index][0], _quickIcons[index][1]);
        },
      ),
    );
  }
}
