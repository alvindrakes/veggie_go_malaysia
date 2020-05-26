import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/screenutil.dart';

class RestaurantCard extends StatelessWidget {
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
              offset: Offset(0, 3), // changes position of shadow
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
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Sky garden vegetarian restaurant',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      '7, Jalan Jasmin 3, Taman Jasmin, 43000 Kajang',
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    //TODO start rating icons here
                    Row(
                      children: <Widget>[
                        Text('10am to 3pm', style: TextStyle(fontSize: 12)),
                        const Expanded(child: SizedBox()),
                        Text('1.2km',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
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
