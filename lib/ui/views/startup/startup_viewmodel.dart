import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';

import '../../../app/router.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  // TODO:
  //    loading,
  //    authentication,
  //    permissions manager,
  Future setup() async {
    await Future.value();
    await _navigationService.replaceWith(Routes.homeViewRoute);
  }
}
