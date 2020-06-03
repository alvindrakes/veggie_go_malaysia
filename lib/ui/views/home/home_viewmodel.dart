import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/app/router.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToSearch() async {
    await _navigationService.navigateTo(Routes.searchViewRoute);
  }
}
