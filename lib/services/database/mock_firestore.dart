import 'dart:async';
import 'package:veggie_go_malaysia/datamodels/announcement.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/services/database/abstract_firestore.dart';

class MockFirestore implements DatabaseService {

  Future<List<Announcement>> getAnnouncements() async {
    return [
      Announcement(
        title: 'Volunteer devs release design overhaul Volunteer devs release design overhaul Volunteer devs release design overhaul Volunteer devs release design overhaul Volunteer devs release design overhaul Volunteer devs release design overhaul Volunteer devs release design overhaul Volunteer devs release design overhaul',
        previewContent: 'A team of global app developers have created this new app from scratch...',
        imageUrl: 'https://i.imgur.com/VTc14WS.png',
      ),
      Announcement(
        title: 'Google searches for vegan food up 68% in Malaysia',
        previewContent: 'Recent trends in online activity indicate increasing...',
        imageUrl: 'https://seotribunal.com/wp-content/uploads/2018/09/google-485611_960_720-1024x723.png',
      ),
    ];
  }

}
