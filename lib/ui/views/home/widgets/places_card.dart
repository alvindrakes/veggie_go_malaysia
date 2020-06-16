import 'package:flutter/material.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/datamodels/place.dart';

class PlacesCard extends StatelessWidget {
  const PlacesCard({@required this.place}) : assert(place != null);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
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

  static const TextStyle _greyTextTyle = TextStyle(color: ThemeColors.textGrey);
}
