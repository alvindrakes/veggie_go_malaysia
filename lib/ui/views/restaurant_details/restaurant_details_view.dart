import 'package:flutter/cupertino.dart';

class RestaurantDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Details'),
        previousPageTitle: 'Home',
      ),
      child: Container(),
    );
  }
}
