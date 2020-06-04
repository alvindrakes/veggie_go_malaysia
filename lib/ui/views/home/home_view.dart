import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/ui/views/home/home_viewmodel.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/announcements.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/location_bar.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/quick_search.dart';

import '../../../constants/colors.dart';
import 'widgets/quick_search.dart';
import 'widgets/restaurant_card/restaurant_card.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: ThemeColors.background,
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: ThemeColors.background,
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50.h),
                      _SearchBar(model),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
                pinned: true,
                floating: true,
                elevation: 0.0,
                expandedHeight: 220.h,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    AnnouncementCarousel(model.announcements),
                  ]),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    QuickSearch(),
                    _FilterResults(),
                    _ResultsListView(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final HomeViewModel model;
  _SearchBar(this.model);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: LocationSelector(model)),
        SizedBox(width: 40.w),
        FlagSelector(),
      ],
    );
  }
}

class _FilterResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.w),
      child: Row(
        children: <Widget>[
          Text(
            'Results',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {
              //TODO tap to open dropdown filter menu
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey6.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 50.w),
                child: Row(
                  children: <Widget>[
                    Text('Nearest'),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Icon(
            Icons.filter_list,
            color: ThemeColors.brightGreen,
          )
        ],
      ),
    );
  }
}

class _ResultsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RestaurantCard(
          restaurant: Restaurant(name: '  ', address: '  ', openingHours: {
            'open': '  ',
            'close': ' ',
          }),
        ),
        RestaurantCard(
          restaurant: Restaurant(
              mainPhoto: NetworkImage(
                  'https://z8e5v5j3.stackpathcdn.com/wp-content/uploads/2019/01/SkyAvenue-Food-Wow.jpg'),
              name: 'Sky Avenue',
              address: 'New york City Yay',
              rating: 5.0,
              openingHours: {
                'open': '12pm',
                'close': '4pm ',
              }),
        ),
      ],
    );
  }
}
