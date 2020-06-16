import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/app/router.dart';
import 'package:veggie_go_malaysia/datamodels/announcement.dart';
import 'package:veggie_go_malaysia/datamodels/place.dart';
import 'package:veggie_go_malaysia/services/database/mock_firestore.dart';

enum Country { Malaysia, Singapore }
enum Mode { Restaurants, Stores }

class HomeViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final MockFirestore _firestoreService = locator<MockFirestore>();

  Country currentCountry =
      Country.Malaysia; // TODO: use location or shared preferences
  Mode currentMode = Mode.Restaurants;

  void toggleMode() async {
    setBusy(true);
    switch (currentMode) {
      case Mode.Restaurants:
        currentMode = Mode.Stores;
        break;
      case Mode.Stores:
        currentMode = Mode.Restaurants;
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
      case Country.Malaysia:
        currentCountry = Country.Singapore;
        break;
      case Country.Singapore:
        currentCountry = Country.Malaysia;
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
