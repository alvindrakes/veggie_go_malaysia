import 'dart:async';

import '../../datamodels/announcement.dart';
import '../../datamodels/place.dart';
import 'abstract_firestore.dart';

class MockFirestore implements DatabaseService {
  @override
  Future<List<Announcement>> getAnnouncements() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      Announcement(
        title: 'Volunteer devs release design overhaul',
        previewContent: '''
A team of global app developers have created this new app from scratch...
''',
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

  @override
  Future<List<Place>> getNearestPlaces() async {
    await Future.delayed(Duration(milliseconds: 500));

    return [
      Place(
        documentID: '1',
        name: 'Kafe The Leaf Healthy House',
        rating: 4.4,
        userRatingsTotal: 290,
        priceLevel: 2,
        longitude: 100.12343,
        latitude: 3.84232,
        mainPhoto:
            'https://lh5.googleusercontent.com/p/AF1QipORDFR9HCVa9WOAVdBX3a8y5JnKLpFVmGN9GlTw=w203-h114-k-no',
      ),
      Place(
        documentID: '2',
        name: 'Restaurant Sayur-Sayuran Shi Yuan',
        rating: 3.8,
        userRatingsTotal: 290,
        priceLevel: 1,
        longitude: 101.322545,
        latitude: 4.252534,
        mainPhoto:
            'https://lh5.googleusercontent.com/p/AF1QipOd22OTPsADGiRAAyYvjOco3vEFQpusOCpdXNj0=w203-h152-k-no',
      ),
    ];
  }

  @override
  Future<List<Place>> getRecommendedPlaces() async {
    await Future.delayed(Duration(milliseconds: 500));

    return [
      Place(
        documentID: '3',
        name: 'BP Dragonfly Garden',
        rating: 4.2,
        userRatingsTotal: 45,
        priceLevel: 1,
        longitude: 100.12343,
        latitude: 3.84232,
        mainPhoto:
            'https://lh5.googleusercontent.com/p/AF1QipN2OAGcRlcgFfLa7Xxw-fEfZLCuVQDjBq0O-2t8=w203-h152-k-no',
      ),
      Place(
        documentID: '4',
        name: 'Boye Vegetarian Cafe',
        rating: 4.0,
        userRatingsTotal: 117,
        priceLevel: 2,
        longitude: 101.322545,
        latitude: 4.252534,
        mainPhoto:
            'https://lh5.googleusercontent.com/p/AF1QipM9U5vwqMrzcp6Ya9WNMfNfwZB99S359TnZknIU=w203-h114-k-no',
      ),
    ];
  }

  @override
  Future<List<Place>> getPopularPlaces() async {
    return [
      Place(
          documentID: '5',
          name: 'Kita Coffee',
          rating: 4.6,
          userRatingsTotal: 48,
          priceLevel: 2,
          longitude: 100.12343,
          latitude: 3.84232,
          mainPhoto:
              'https://lh5.googleusercontent.com/p/AF1QipMpcuLud85oim0rilm-bLKdrXpiDEnqRln8KIFh=w203-h203-k-no'),
      Place(
        documentID: '6',
        name: 'Malaysia Yu Hua Zhai Association',
        rating: 4.7,
        userRatingsTotal: 44,
        priceLevel: 2,
        longitude: 101.322545,
        latitude: 4.252534,
        mainPhoto:
            'https://lh5.googleusercontent.com/p/AF1QipNbxjxqROK-kQ2DIEXaLjIYS2bvAed8DjO9r7tr=w203-h114-k-no',
      ),
    ];
  }
}
