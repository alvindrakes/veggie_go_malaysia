import 'dart:core';

import 'package:flutter/cupertino.dart';

class Restaurant {
  final String name;
  final String address;
  final double rating;
  final Map<String, dynamic> openingHours;
  final double latitude;
  final double longitude;

  final NetworkImage mainPhoto;
  // Calculate distance from user with a method
  double _distanceFromUser;

  Restaurant({
    @required this.name,
    this.address,
    this.rating,
    this.openingHours,
    this.latitude,
    this.longitude,
    this.mainPhoto,
  })  :
        // Don't allow restaurant to display to user if name isn't known
        assert(name != null && name != ''),
        // Both geolocation and address can't be missing at the same time
        assert(((latitude != null) && (longitude != null)) ||
            (address != null && address != ''));

  double get distanceFromUser {
    // TODO: calculate distance using latitude and longitude
    _distanceFromUser = 1.2;
    return _distanceFromUser;
  }
}
