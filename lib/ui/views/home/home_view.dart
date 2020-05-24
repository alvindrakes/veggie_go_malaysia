import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/ui/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 80.h),
                child: _SearchBar(),
              ),
              _AnnouncementCarousel(),
              _QuickSearch(),
              _FilterResults(),
              _ResultsListView(),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: _LocationSelector()),
        SizedBox(width: 40.w),
        _FlagSelector(),
      ],
    );
  }
}

class _LocationSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
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

class _FlagSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      // TODO: flag selector widget
      child: Image.asset('assets/images/MalaysiaFlag.png'),
    );
  }
}

class _AnnouncementCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _QuickSearch extends StatelessWidget {
  static Widget _customIcon(Color color, String text) {
    return SizedBox(
      width: 220.w,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 80.w,
            backgroundColor: color,
          ),
          SizedBox(height: 10.h),
          Text(text),
        ],
      ),
    );
  }

  final List<Widget> _quickIconsFirst = [
    _customIcon(ThemeColors.searchBarIcon, 'Japanese'),
    _customIcon(ThemeColors.searchBarIcon, 'Chinese'),
    _customIcon(ThemeColors.searchBarIcon, 'Western'),
    _customIcon(ThemeColors.searchBarIcon, 'Indian'),
  ];
  final List<Widget> _quickIconsSecond = [
    _customIcon(ThemeColors.searchBarIcon, 'Korean'),
    _customIcon(ThemeColors.searchBarIcon, 'Thai'),
    _customIcon(ThemeColors.searchBarIcon, 'Mixed'),
    _customIcon(ThemeColors.searchBarIcon, 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class _FilterResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ResultsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
