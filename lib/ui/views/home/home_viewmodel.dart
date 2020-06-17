import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../datamodels/announcement.dart';
import '../../../datamodels/place.dart';
import '../../../services/database/mock_firestore.dart';

enum Country { malaysia, singapore }
enum Mode { restaurants, stores }

class HomeViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final MockFirestore _firestoreService = locator<MockFirestore>();

  Country currentCountry =
      Country.malaysia; // TODO: use location or shared preferences
  Mode currentMode = Mode.restaurants;

  void toggleMode() async {
    setBusy(true);
    switch (currentMode) {
      case Mode.restaurants:
        currentMode = Mode.stores;
        break;
      case Mode.stores:
        currentMode = Mode.restaurants;
        break;
    }
    notifyListeners();
    // mock
    await Future.delayed(Duration(milliseconds: 500));
    // TODO:
    setBusy(false);
  }

  void switchCountry() async {
    setBusy(true);
    switch (currentCountry) {
      case Country.malaysia:
        currentCountry = Country.singapore;
        break;
      case Country.singapore:
        currentCountry = Country.malaysia;
        break;
    }
    notifyListeners();
    // mock
    await Future.delayed(Duration(milliseconds: 500));
    // TODO:
    setBusy(false);
  }

  List<Announcement> _announcements = <Announcement>[];
  List<Announcement> get announcements => _announcements;

  List<Place> _nearestPlaces = <Place>[];
  List<Place> get nearestPlaces => _nearestPlaces;
  List<Place> _recommendedPlaces = <Place>[];
  List<Place> get recommendedPlaces => _recommendedPlaces;
  List<Place> _popularPlaces = <Place>[];
  List<Place> get popularPlaces => _popularPlaces;

  void navigateToSearch() async {
    await _navigationService.navigateTo(Routes.searchViewRoute);
  }

  @override
  Future futureToRun() async {
    setBusy(true);
    _announcements = await _firestoreService.getAnnouncements();
    _nearestPlaces = await _firestoreService.getNearestPlaces();
    _recommendedPlaces = await _firestoreService.getRecommendedPlaces();
    _popularPlaces = await _firestoreService.getPopularPlaces();
    setBusy(false);
  }
}
