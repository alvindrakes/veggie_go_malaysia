import '../../datamodels/announcement.dart';
import '../../datamodels/place.dart';
import 'abstract_firestore.dart';

class FirestoreService implements DatabaseService {
  @override
  Future<List<Announcement>> getAnnouncements() {
    // TODO: implement getAnnouncements
    throw UnimplementedError();
  }

  @override
  Future<List<Place>> getNearestPlaces() {
    // TODO: implement getNearestPlaces
    throw UnimplementedError();
  }

  @override
  Future<List<Place>> getPopularPlaces() {
    // TODO: implement getPopularPlaces
    throw UnimplementedError();
  }

  @override
  Future<List<Place>> getRecommendedPlaces() {
    // TODO: implement getRecommendedPlaces
    throw UnimplementedError();
  }
}
