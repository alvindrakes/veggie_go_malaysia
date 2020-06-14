import 'package:flutter/material.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/datamodels/place.dart';

class ResultsListView extends StatelessWidget {
  final String title;
  final List<Place> nearestPlaces;
  ResultsListView(this.title, this.nearestPlaces);

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
              SizedBox(width: 5),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nearestPlaces.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index == nearestPlaces.length
                    ? Container(
                        width: 150,
                        child: Material(
                          color: ThemeColors.background,
                          child: Center(
                            child: Ink(
                              decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                  shadows: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.grey[200],
                                        spreadRadius: 1,
                                        offset: Offset(0, 2))
                                  ]),
                              child: IconButton(
                                icon: Image.asset(
                                  'assets/icons/arrow_right.png',
                                  width: 20,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          color: Colors.red,
                          width: 210,
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
