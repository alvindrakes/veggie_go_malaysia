import 'dart:async';

import 'package:veggie_go_malaysia/datamodels/announcement.dart';
import 'package:veggie_go_malaysia/datamodels/place.dart';
import 'package:veggie_go_malaysia/services/database/abstract_firestore.dart';

class MockFirestore implements DatabaseService {
  Future<List<Announcement>> getAnnouncements() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      Announcement(
        title: 'Volunteer devs release design overhaul',
        previewContent:
            'A team of global app developers have created this new app from scratch...',
        imageUrl: 'https://i.imgur.com/VTc14WS.png',
      ),
      Announcement(
        title: 'Google searches for vegan food up 68% in Malaysia',
        previewContent:
            'Recent trends in online activity indicate increasing...',
        imageUrl:
            'https://seotribunal.com/wp-content/uploads/2018/09/google-485611_960_720-1024x723.png',
      ),
    ];
  }

  Future<List<Place>> getNearestPlaces() async {
    await Future.delayed(Duration(milliseconds: 500));

    return [
      Place(
          name: 'Kafe The Leaf Healthy House',
          longitude: 100.12343,
          latitude: 3.84232),
      Place(
          name: 'Restaurant Sayur-Sayuran Shi Yuan',
          longitude: 101.322545,
          latitude: 4.252534),
    ];
  }

  Future<List<Place>> getRecommendedPlaces() async {
    await Future.delayed(Duration(milliseconds: 500));

    return [
      Place(
          name: 'BP Dragonfly Garden', longitude: 100.12343, latitude: 3.84232),
      Place(
          name: 'Boye Vegetarian Cafe',
          longitude: 101.322545,
          latitude: 4.252534),
    ];
  }

  Future<List<Place>> getPopularPlaces() async {
    return [
      Place(name: 'Kita Coffee', longitude: 100.12343, latitude: 3.84232),
      Place(
          name: 'Malaysia Yu Hua Zhai Association',
          longitude: 101.322545,
          latitude: 4.252534),
    ];
  }

  Future<List<Place>> getBudgetPlaces() async {
    return [
      Place(name: 'Kita Coffee', longitude: 100.12343, latitude: 3.84232),
      Place(
          name: 'Malaysia Yu Hua Zhai Association',
          longitude: 101.322545,
          latitude: 4.252534),
    ];
  }
}
