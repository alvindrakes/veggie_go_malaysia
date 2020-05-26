import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/screenutil.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({@required this.restaurant});
  final Restaurant restaurant;

  //TODO write widget test
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                      restaurant.name,
                      key: Key('restaurantName'),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      restaurant.address,
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
                        Text(
                          '1.2km',
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
    );
  }
}
