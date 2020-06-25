import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/locator.dart';
import '../../../../../app/router.dart';
import '../../../../../datamodels/place.dart';

class PlacesCardModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToPlaceDetails(Place place) {
    _navigationService.navigateTo(Routes.placeDetailsRoute, arguments: place);
  }
}
