import 'package:flutter/material.dart';

class Country {
  final String countryName;
  final Image countryImage;

  Country(this.countryName, this.countryImage);

  static List<Country> country = <Country>[
    Country('Malaysia', Image.asset('assets/images/MalaysiaFlag.png')),
    Country('Singapore', Image.asset('assets/images/SingaporeFlag.png')),
  ];
}