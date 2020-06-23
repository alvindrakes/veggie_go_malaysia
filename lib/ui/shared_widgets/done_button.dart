import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/touchable_opacity.dart';

class DoneButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: ThemeColors.background,
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 10.0),
        child: TouchableOpacity(
          activeOpacity: 0.4,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: ThemeColors.brightGreen,
              borderRadius: BorderRadius.circular(4.0),
            ),
            width: double.infinity,
            child: Center(
                child: Text(
              'Done',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
