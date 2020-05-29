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
      geolocationService.location = location;

      when(location.serviceEnabled()).thenAnswer((_) async => true);

      when(location.hasPermission())
          .thenAnswer((_) async => PermissionStatus.granted);

      when(location.getLocation()).thenAnswer((_) async => LocationData.fromMap(
          {'latitude': -45.501690, 'longitude': -73.567253}));

      var userLocation = await geolocationService.getLocation();
      expect(
        userLocation.latitude,
        -45.501690,
      );
      expect(
        userLocation.longitude,
        -73.567253,
      );
    });
  });
}
