import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/app/locator.dart';

import '../../../app/router.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  // TODO:
  //    loading,
  //    authentication,
  //    permissions manager,
  Future setup() async {
    await Future.delayed(Duration(milliseconds: 200));
    _navigationService.replaceWith(Routes.homeViewRoute);
  }
}
