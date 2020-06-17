import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../home_viewmodel.dart';
import 'location_bar.dart';

class SearchBar extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: <Widget>[
          Expanded(child: LocationSelector()),
          const SizedBox(width: 10),
          GestureDetector(
            child: Image.asset(
              'assets/icons/filter.png',
              height: 20,
            ),
            onTap: () {},
          ),
        ],
      ),
      pinned: true,
      elevation: 0.0,
      expandedHeight: 60,
    );
  }
}
