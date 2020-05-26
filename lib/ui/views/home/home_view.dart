import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/ui/views/home/home_viewmodel.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/location_bar.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/restaurant_card.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 80.h),
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
        Expanded(child: LocationSelector()),
        SizedBox(width: 40.w),
        FlagSelector(),
      ],
    );
  }
}

class _AnnouncementCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ThemeColors.searchBarIcon,
          ),
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: false,
        height: 500.h,
      ),
    );
  }
}

class _QuickSearch extends StatelessWidget {
  static Widget _customIcon(Color color, String text) {
    return SizedBox(
      width: 250.w,
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

class _FilterResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ResultsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RestaurantCard(
      restaurant: Restaurant(
        name: 'sky avaenu',
        address: 'new york street',
      ),
    );
  }
}
