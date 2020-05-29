import 'dart:async';

import 'package:location/location.dart';
import 'package:veggie_go_malaysia/datamodels/user_location.dart';

class GeoLocationService {
  Location location = Location();

  Future<UserLocation> getLocation() async {
    UserLocation currentLocation;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    try {
      var userLocation = await location.getLocation();

      currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      throw Exception('Could not get location: ${e.toString()}');
    }

    return currentLocation;
  }
}
