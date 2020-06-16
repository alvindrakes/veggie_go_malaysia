import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/ui/views/home/home_viewmodel.dart';

class SelectorChip extends ViewModelWidget<HomeViewModel> {
  final Mode mode;
  final String modeText;

  const SelectorChip(this.modeText, this.mode);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return ChoiceChip(
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          modeText,
          style: TextStyle(
              fontFamily: 'Lato',
              color: model.currentMode == mode
                  ? Colors.white
                  : ThemeColors.brightGreen,
              fontSize: 14,
              fontWeight: model.currentMode == mode ? FontWeight.w600 : null),
        ),
      ),
      selected: model.currentMode == mode,
      selectedColor: ThemeColors.brightGreen,
      backgroundColor: Colors.white,
      onSelected: (_) => model.toggleMode(),
      pressElevation: 0,
    );
  }
}
