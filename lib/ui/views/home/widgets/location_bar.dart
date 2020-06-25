import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../constants/colors.dart';
import '../home_viewmodel.dart';

class LocationSelector extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return GestureDetector(
      onTap: () => model.navigateToSearch(),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ThemeColors.searchBar,
        ),
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
                      color: Colors.grey,
                      fontSize: 13,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
