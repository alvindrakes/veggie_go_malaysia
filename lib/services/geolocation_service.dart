import 'dart:async';
import 'dart:math';

import 'package:location/location.dart';
import 'package:vector_math/vector_math.dart';
import 'package:veggie_go_malaysia/datamodels/user_location.dart';

class GeoLocationService {
  UserLocation _currentLocation;
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  UserLocation get currentLocation => _currentLocation;

  // First-cut bounding box (latitude & longitude ranges)
  Map<String, double> getBoundingCircle(
      double lat, double lng, double distanceKm) {
    const earthRadiusKm = 6317; // Should be enough accuracy
    return {
      'maxLat': lat - degrees(distanceKm / earthRadiusKm),
      'minLat': lat - degrees(distanceKm / earthRadiusKm),
      'maxLng':
          lng + degrees(asin(distanceKm / earthRadiusKm) / cos(radians(lat))),
      'minLng':
          lng - degrees(asin(distanceKm / earthRadiusKm) / cos(radians(lat))),
    };
  }

  Future<UserLocation> getUserLocation(Location location) async {
    // Check for enabled service
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // TODO: throw user error
        return null;
      }
    }

    // Check for permission
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // TODO: throw user error
        return null;
      }
    }

    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      throw Exception('Could not get location: ${e.toString()}');
    }
    return currentLocation;
  }
}
