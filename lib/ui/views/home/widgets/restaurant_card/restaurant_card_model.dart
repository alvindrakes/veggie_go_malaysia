import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/app/router.dart';

class RestaurantCardModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToRestaurantDetails() {
    _navigationService.navigateTo(Routes.retaurantDetailsRoute);
  }
}
