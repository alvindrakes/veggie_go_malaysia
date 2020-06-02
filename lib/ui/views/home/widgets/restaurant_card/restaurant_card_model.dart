import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/app/router.dart';

class RestaurantCardModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future<String> calculateDistanceFromUser() async {
    return '1.2km';
  }

  @override
  Future futureToRun() => calculateDistanceFromUser();

  void navigateToRestaurantDetails() {
    _navigationService.navigateTo(Routes.retaurantDetailsRoute);
  }
}
