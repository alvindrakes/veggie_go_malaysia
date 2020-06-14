import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:veggie_go_malaysia/services/geolocation_service.dart';

class MockLocation extends Mock implements Location {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final geolocationService = GeoLocationService();

  group('GeoLocationService', () {
    test(
        'returns a location if the service is enabled and permission is granted completes successfully',
        () async {
      final location = MockLocation();

      when(location.serviceEnabled()).thenAnswer((_) async => true);

      when(location.hasPermission())
          .thenAnswer((_) async => PermissionStatus.granted);

      when(location.getLocation()).thenAnswer((_) async => LocationData.fromMap(
          {'latitude': -45.501690, 'longitude': -73.567253}));

      var userLocation = await geolocationService.getUserLocation(location);
      expect(
        userLocation.latitude,
        -45.501690,
      );
      expect(
        userLocation.longitude,
        -73.567253,
      );
    });

    test('returns null if the location service permission is denied', () async {
      final location = MockLocation();

      when(location.serviceEnabled()).thenAnswer((_) async => true);

      when(location.hasPermission())
          .thenAnswer((_) async => PermissionStatus.denied);

      when(location.getLocation()).thenAnswer((_) async => LocationData.fromMap(
          {'latitude': -45.501690, 'longitude': -73.567253}));

      var userLocation = await geolocationService.getUserLocation(location);
      expect(
        userLocation,
        null,
      );
    });
  });

  group('First-cut bounding box', () {
    test('checks valid inputs', () {
      var bounds = geolocationService.getBoundingCircle(
          4.549170500000001, 101.1087441, 10);
      expect(bounds['maxLat'], bounds['minLat']);
      expect(bounds['maxLng'] - bounds['minLng'], 0.18197523076980815);
    });
  });
}
