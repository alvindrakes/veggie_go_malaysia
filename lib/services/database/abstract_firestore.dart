import '../../datamodels/announcement.dart';
import '../../datamodels/place.dart';

abstract class DatabaseService {
  Future<List<Announcement>> getAnnouncements();
  Future<List<Place>> getNearestPlaces();
  Future<List<Place>> getRecommendedPlaces();
  Future<List<Place>> getPopularPlaces();
}
