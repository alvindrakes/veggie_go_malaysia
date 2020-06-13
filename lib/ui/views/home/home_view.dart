import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/datamodels/announcement.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/ui/views/home/home_viewmodel.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/location_bar.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/quick_search.dart';

import '../../../constants/colors.dart';
import 'widgets/quick_search.dart';
import 'widgets/restaurant_card/restaurant_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String dropdownValue = 'Malaysia'; // TODO: handle in viewmodel instead
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColors.background,
            child: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                elevation: 0,
                floating: true,
                backgroundColor: Colors.white,
                title: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 35,
                      width: 35,
                    ),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Container(
                        height: 8,
                        child: Image.asset(
                          'assets/images/arrow_down.png',
                        ),
                      ),
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                      underline: Container(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Malaysia', 'Singapore']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.white,
                title: Row(
                  children: <Widget>[
                    Chip(
                      label: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Restaurants',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      backgroundColor: ThemeColors.brightGreen,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      backgroundColor: Colors.white,
                      label: Text(
                        'Stores',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            color: ThemeColors.brightGreen),
                      ),
                    ),
                  ],
                ),
              ),
              _SearchBar(model),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 20),
                  QuickSearch(),
                  SizedBox(height: 10),
                ]),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: 10),
                    _AnnouncementCarousel(model.announcements),
                  ]),
                ),
              ),
            ]),
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
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: <Widget>[
          Expanded(child: LocationSelector(model)),
          SizedBox(width: 10),
          IconButton(
            icon: Image.asset(
              'assets/images/filter.png',
              height: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
      pinned: true,
      elevation: 0.0,
      expandedHeight: 60,
    );
  }
}

class _AnnouncementCarousel extends StatelessWidget {
  final List<Announcement> announcements;
  _AnnouncementCarousel(this.announcements);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: announcements.length,
      itemBuilder: (BuildContext context, int itemIndex) {
        var item = announcements[itemIndex];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    color: Colors.grey[200],
                    offset: Offset(0, 2))
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: <Widget>[
                          Text(
                            item.title,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            item.previewContent,
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: CachedNetworkImage(imageUrl: item.imageUrl),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 130,
        viewportFraction: 1,
        autoPlay: true,
        enableInfiniteScroll: false,
        autoPlayInterval: Duration(seconds: 10),
        autoPlayAnimationDuration: Duration(milliseconds: 500),
        enlargeCenterPage: true,
        reverse: false,
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
