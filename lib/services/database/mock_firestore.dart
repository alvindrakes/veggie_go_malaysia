import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/services/database/abstract_firestore.dart';

class MockFirestore implements DatabaseService {
  Future<List<Restaurant>> _fetchResults;
}
