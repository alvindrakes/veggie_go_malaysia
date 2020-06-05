import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/ui/views/home/home_viewmodel.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/location_bar.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/quick_search.dart';

import 'widgets/flag_selector.dart';
import 'widgets/modal_bottom_widget.dart';
import 'widgets/restaurant_card/restaurant_card.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 80.h),
                    child: _SearchBar(),
                  ),
                  _AnnouncementCarousel(),
                  QuickSearch(),
                  _FilterResults(),
                  _ResultsListView(),
                ],
              ),
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
        Expanded(flex: 4, child: LocationSelector()),
        SizedBox(width: 40.w),
        Expanded(flex: 1, child: FlagSelector()),
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

class _FilterResults extends HookViewModelWidget<HomeViewModel> {
  _FilterResults({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
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
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ModalBottomWidget(context, viewModel)),
                ),
              );
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
