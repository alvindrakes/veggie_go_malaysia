import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/services/database/mock_firestore.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<MockFirestore>(() => MockFirestore());
}
