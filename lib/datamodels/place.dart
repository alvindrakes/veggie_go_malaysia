import 'dart:core';

import 'package:flutter/cupertino.dart';

class Place {
  final String documentID;
  final String name;
  final String address;
  final double rating;
  final int userRatingsTotal;
  final int priceLevel; // 1(cheap)-5(expensive)

  final Map<String, dynamic> openingHours;
  final double latitude;
  final double longitude;

  final List<String> vendorType;
  final List<String> features;
  final List<String> foodType;

  final String mainPhoto;
  // Calculate distance from user with a method
  double _distanceFromUser;

  Place({
    @required this.documentID,
    @required this.name,
    this.address,
    this.rating,
    this.vendorType,
    this.features,
    this.foodType,
    this.userRatingsTotal,
    this.priceLevel,
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
