import 'package:flutter/material.dart';
import 'package:veggie_go_malaysia/ui/views/home/home_viewmodel.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/location_bar.dart';

class SearchBar extends StatelessWidget {
  final HomeViewModel model;
  SearchBar(this.model);
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
              'assets/icons/filter.png',
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
