import 'package:flutter/cupertino.dart';

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({@required this.latitude, @required this.longitude})
      : assert((latitude != null) && (latitude != 0)),
        assert((longitude != null) && (longitude != 0));
}
