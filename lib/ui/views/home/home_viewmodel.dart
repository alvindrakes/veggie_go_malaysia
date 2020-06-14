import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/app/router.dart';
import 'package:veggie_go_malaysia/datamodels/announcement.dart';
import 'package:veggie_go_malaysia/datamodels/place.dart';
import 'package:veggie_go_malaysia/services/database/mock_firestore.dart';

class HomeViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final MockFirestore _firestoreService = locator<MockFirestore>();

  List<Announcement> _announcements = <Announcement>[];
  List<Announcement> get announcements => _announcements;

  List<Place> _nearestPlaces = <Place>[];
  List<Place> get nearestPlaces => _nearestPlaces;

  void navigateToSearch() async {
    await _navigationService.navigateTo(Routes.searchViewRoute);
  }

  @override
  Future futureToRun() async {
    _announcements = await _firestoreService.getAnnouncements();
    _nearestPlaces = await _firestoreService.getNearestPlaces();
    print(_nearestPlaces);
  }
}
