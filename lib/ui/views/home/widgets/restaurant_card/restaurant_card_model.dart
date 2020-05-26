import 'package:stacked/stacked.dart';

class RestaurantCardModel extends FutureViewModel {
  Future<String> calculateDistanceFromUser() async {
    return '1.2km';
  }

  @override
  Future futureToRun() => calculateDistanceFromUser();
}
