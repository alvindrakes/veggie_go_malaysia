import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/datamodels/place.dart';

class PlacesCard extends StatelessWidget {
  const PlacesCard({
    @required this.place,
    @required this.showExtraInfo,
    this.showFavourite = false,
  }) : assert(place != null);

  final Place place;
  final bool showFavourite;
  final bool showExtraInfo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          showExtraInfo == true
              ? SizedBox(
                  height: 154,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/restaurant.jpg'),
                          ),
                        ),
                      ),
                      _extraInfoContainer(),
                    ],
                  ),
                )
              : Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/restaurant.jpg'),
                    ),
                  ),
                ),
          const SizedBox(height: 5.0),
          Text(
            place.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                place.rating.toStringAsFixed(1),
                style: TextStyle(
                  color: ThemeColors.brightGreen,
                ),
              ),
              const SizedBox(width: 4.0),
              Text(
                '(54)',
                style: _greyTextTyle,
              ),
              const SizedBox(width: 10.0),
              Text(
                '\$',
                style: _greyTextTyle,
              ),
              const Spacer(),
              Flexible(
                flex: 2,
                child: Text(
                  'Breakfast',
                  style: _greyTextTyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          Text(
            'Cozy.Casual.Good for kids',
            style: _greyTextTyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Row(
            children: <Widget>[
              Text('${place.distanceFromUser.toString()} km',
                  style: _greyTextTyle),
              const Spacer(),
              Text(
                'Open',
                style: TextStyle(
                  color: ThemeColors.brightGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _extraInfoContainer() {
    return Positioned(
      right: 15.0,
      bottom: 0.0,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF727272).withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white,
        ),
        child: showFavourite
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '241',
                      style: TextStyle(fontSize: 11.0),
                    ),
                    const SizedBox(width: 5.0),
                    Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 16.0,
                    ),
                  ],
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          '5-7',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0,
                          ),
                        ),
                        Text(
                          'min',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5.0),
                    SvgPicture.asset(
                      'assets/icons/walk.svg',
                      height: 16,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  static const TextStyle _greyTextTyle = TextStyle(color: ThemeColors.textGrey);
}
