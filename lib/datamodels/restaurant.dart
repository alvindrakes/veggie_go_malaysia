import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:veggie_go_malaysia/constants/placeholders.dart';

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

  Restaurant(
      {@required this.name,
      this.address,
      this.rating,
      this.openingHours,
      this.latitude,
      this.longitude,
      this.mainPhoto = Placeholders.restaurantImage})
      :
        // Don't allow restaurant to display to user if name isn't known
        assert(name != null && name != ''),
        // Both geolocation and address can't be missing at the same time
        assert(((latitude != null) && (longitude != null)) ||
            (address != null && address != ''));

  double get distanceFromUser {
    // TODO: calculate distance using latitude and longitude
    return _distanceFromUser;
  }
}
