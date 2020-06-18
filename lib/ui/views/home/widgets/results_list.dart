import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../datamodels/place.dart';
import '../../../../enum/places_result_type.dart';
import 'places_card/places_card.dart';

class ResultsListView extends StatelessWidget {
  final String title;
  final List<Place> places;
  final PlacesResultType resultType;
  ResultsListView(
    this.title,
    this.places,
    this.resultType,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/icons/arrow_right.png',
                height: 14,
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: places.length + 1,
              itemBuilder: (context, index) {
                return index == places.length
                    ? _circularArrowSection()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: PlacesCard(
                          showExtraInfo: [
                            PlacesResultType.nearest,
                            PlacesResultType.popular
                          ].contains(resultType)
                              ? true
                              : false,
                          showFavourite: resultType == PlacesResultType.popular
                              ? true
                              : false,
                          place: places[index],
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _circularArrowSection() {
    return Container(
      width: 150,
      color: ThemeColors.background,
      child: Center(
        child: GestureDetector(
          child: Container(
            width: 45,
            height: 45,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
                shadows: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.grey[200],
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/icons/arrow_right.png',
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
