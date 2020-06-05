import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:veggie_go_malaysia/datamodels/country.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home_viewmodel.dart';

class FlagSelector extends HookViewModelWidget<HomeViewModel> {
  FlagSelector({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel model) =>
      Container(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Country>(
            isExpanded: true,
            value: model.selectedCountry,
            items: Country.country.map((country) {
              return DropdownMenuItem<Country>(
                value: country,
                child: Container(height: 100.h, child: country.countryImage),
              );
            }).toList(),
            onChanged: (value) {
            model.changeCountry(value);
            },
          ),
        ),
      );
}
