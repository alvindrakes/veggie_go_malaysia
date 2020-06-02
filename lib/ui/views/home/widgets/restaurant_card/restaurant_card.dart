import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';

import 'restaurant_card_model.dart';
import 'package:veggie_go_malaysia/utils/custom_extensions.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({@required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestaurantCardModel>.reactive(
      onModelReady: (model) => model.calculateDistanceFromUser(),
      builder: (context, model, _) => GestureDetector(
        onTap: () => model.navigateToRestaurantDetails(),
        child: Container(
          margin: EdgeInsets.only(top: 70.h),
          height: 500.h,
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
                key: Key('restaurantPhoto'),
                height: double.infinity,
                width: 500.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: restaurant.mainPhoto ??
                        AssetImage('assets/images/empty_placeholder.jpg'),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(60.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _showPresetTextOrData(
                          restaurant.name,
                          'No name found',
                        ),
                        key: Key('restaurantName'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        _showPresetTextOrData(
                          restaurant.address,
                          'No address found',
                        ),
                        key: Key('restaurantAddress'),
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(
                        key: Key('ratingStar'),
                        child: SmoothStarRating(
                          isReadOnly: true,
                          allowHalfRating: true,
                          starCount: 5,
                          color: ThemeColors.brightGreen,
                          borderColor: ThemeColors.brightGreen,
                          rating: restaurant.rating ?? 0,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            _showPresetTextOrBusinessHours(
                              restaurant.openingHours,
                              ' - ',
                            ),
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

  String _showPresetTextOrData(String data, String presetText) {
    if (data.isNullEmptyOrWhitespace) {
      return presetText;
    }

    return data;
  }

  String _showPresetTextOrBusinessHours(
      Map<String, dynamic> data, String presetText) {
    final values = data.values.toList();

    if ((values[0] as String).isNullEmptyOrWhitespace ||
        (values[1] as String).isNullEmptyOrWhitespace) {
      return presetText;
    }

    return '${values[0]} to ${values[1]}';
  }
}
