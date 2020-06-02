import 'package:flutter/cupertino.dart';

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({@required this.latitude, @required this.longitude})
      : assert(latitude != null),
        assert(longitude != null);
}
