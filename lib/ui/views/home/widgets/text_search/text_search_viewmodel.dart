import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/app/locator.dart';

class SearchViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void pop() {
    _navigationService.back();
  }
}
