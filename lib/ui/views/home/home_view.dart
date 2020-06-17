import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/colors.dart';
import '../../shared_widgets/shimmers.dart';
import 'home_viewmodel.dart';
import 'widgets/announcement.dart';
import 'widgets/quick_search.dart';
import 'widgets/results_list.dart';
import 'widgets/search_bar.dart';
import 'widgets/selector_chip.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
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
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value: model.currentCountry == Country.malaysia
                          ? 'Malaysia'
                          : 'Singapore',
                      icon: Container(
                        height: 8,
                        child: Image.asset(
                          'assets/icons/arrow_down.png',
                        ),
                      ),
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                      underline: Container(),
                      onChanged: (_) => model.switchCountry(),
                      items: <String>['Malaysia', 'Singapore']
                          .map<DropdownMenuItem<String>>((value) {
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
                    Wrap(
                      children: [
                        SelectorChip('Restaurants', Mode.restaurants),
                        const SizedBox(
                          width: 10,
                        ),
                        SelectorChip('Stores', Mode.stores),
                      ],
                    ),
                  ],
                ),
              ),
              SearchBar(),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: model.isBusy ? ShimmerGrid() : QuickSearch(),
                  )
                ]),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 5),
                    model.isBusy
                        ? const ShimmerList()
                        : AnnouncementCarousel(model.announcements),
                  ]),
                ),
              ),
              model.isBusy
                  ? const SliverToBoxAdapter(child: SizedBox())
                  : SliverList(
                      delegate: SliverChildListDelegate([
                        ResultsListView('Nearest to You', model.nearestPlaces),
                        ResultsListView('Recommended', model.recommendedPlaces),
                        ResultsListView(
                            'Popular among users', model.popularPlaces),
                      ]),
                    ),
            ]),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.futureToRun(),
    );
  }
}
