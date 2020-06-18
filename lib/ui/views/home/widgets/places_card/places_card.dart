import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/utils/intersperse.dart';

import '../../../../../constants/colors.dart';
import '../../../../../datamodels/place.dart';
import 'places_card_viewmodel.dart';

class PlacesCard extends StatelessWidget {
  const PlacesCard({
    @required this.place,
    @required this.showExtraInfo,
    this.showFavourite = false,
  })  : assert(place != null),
        assert(showExtraInfo != null);

  final Place place;
  final bool showFavourite;
  final bool showExtraInfo;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlacesCardModel>.nonReactive(
      builder: (context, model, _) => GestureDetector(
        onTap: () => model.navigateToPlaceDetails(place),
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              showExtraInfo == true
                  ? _ImageWithExtraInfo(
                      place: place,
                      showFavourite: showFavourite,
                    )
                  : _PlaceCardImage(place: place),
              const SizedBox(height: 5.0),
              Text(
                place.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
              _RatingInfoRow(place: place),
              _DescriptionRow(place: place),
              _DistanceAndOpeningRow(place: place),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => PlacesCardModel(),
    );
  }
}

class _PlaceCardImage extends StatelessWidget {
  const _PlaceCardImage({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: place.documentID,
      child: CachedNetworkImage(
        imageUrl: place.mainPhoto,
        imageBuilder: (context, imageProvider) => Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

class _ImageWithExtraInfo extends StatelessWidget {
  const _ImageWithExtraInfo({
    Key key,
    @required this.place,
    @required this.showFavourite,
  }) : super(key: key);

  final Place place;
  final bool showFavourite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: Stack(
        children: <Widget>[
          _PlaceCardImage(place: place),
          _ExtraInfoContainer(showFavourite: showFavourite),
        ],
      ),
    );
  }
}

class _ExtraInfoContainer extends StatelessWidget {
  const _ExtraInfoContainer({
    Key key,
    @required this.showFavourite,
  }) : super(key: key);

  final bool showFavourite;

  @override
  Widget build(BuildContext context) {
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
}

class _DescriptionRow extends StatelessWidget {
  const _DescriptionRow({
    Key key,
    this.place,
  }) : super(key: key);

  final Place place;

  static const _middotUnicode = '\u22C5';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TextStyle(
                fontSize: 11,
                color: ThemeColors.textGrey,
              ),
              children: intersperse(
                      TextSpan(text: ' $_middotUnicode '),
                      place.features
                          .map((String feature) => TextSpan(text: feature))
                          .toList())
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _DistanceAndOpeningRow extends StatelessWidget {
  const _DistanceAndOpeningRow({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '${place.distanceFromUser.toStringAsFixed(1)} km',
          style: TextStyle(
            color: ThemeColors.textGrey,
            fontSize: 13,
          ),
        ),
        const Spacer(),
        Text(
          'Open',
          style: TextStyle(
            color: ThemeColors.brightGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _RatingInfoRow extends StatelessWidget {
  const _RatingInfoRow({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.star,
              size: 20,
              color: (place.rating ?? 0.0) >= 4.4
                  ? ThemeColors.brightGreen
                  : ThemeColors.earthyGreen,
            ),
            SizedBox(width: 5),
            Text(
              place.rating.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 14,
                color: place.rating >= 4.4
                    ? ThemeColors.brightGreen
                    : ThemeColors.earthyGreen,
              ),
            ),
            SizedBox(width: 5),
            Text(
              '(${place.userRatingsTotal}+)',
              style: TextStyle(
                color: ThemeColors.textGrey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(width: 5),
        Text(
          '\$' * place.priceLevel,
          style: TextStyle(
            color: ThemeColors.textGrey,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 5),
        Flexible(
          child: Text(
            place.vendorType[0] ?? '',
            style: TextStyle(
              color: ThemeColors.textGrey,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
