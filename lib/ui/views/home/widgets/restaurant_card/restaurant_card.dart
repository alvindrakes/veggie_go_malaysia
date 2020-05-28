import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';

import 'restaurant_card_model.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({@required this.restaurant});

  final Restaurant restaurant;

  //TODO write widget test
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestaurantCardModel>.reactive(
      onModelReady: (model) => model.calculateDistanceFromUser(),
      builder: (context, model, _) => GestureDetector(
        onTap: () {
          //TODO navigate to restaurant details view
        },
        child: Container(
          height: ScreenUtil().setHeight(500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: CupertinoColors.white,
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.systemGrey5.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: ScreenUtil().setHeight(500),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/images/restaurant.jpg') //Placeholders.restaurantImage,
                      ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(60.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        restaurant.name.removeWhiteSpacesShowLength() == 0
                            ? 'No name found'
                            : restaurant.name,
                        key: Key('restaurantName'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        restaurant.address.removeWhiteSpacesShowLength() == 0
                            ? 'No address found'
                            : restaurant.address,
                        key: Key('restaurantAddress'),
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      //TODO start rating icons here
                      Row(
                        children: <Widget>[
                          Text(
                            '10am to 3pm',
                            key: Key('businessHours'),
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Expanded(child: SizedBox()),
                          model.isBusy
                              ? const SizedBox()
                              : Text(
                                  model.data,
                                  key: Key('distanceFromUser'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => RestaurantCardModel(),
    );
  }
}

extension StringExtension on String {
  int removeWhiteSpacesShowLength() {
    final processedText = replaceAll(RegExp(r'\s+\b|\b\s|\s|\b'), '');

    return processedText.length;
  }
}
