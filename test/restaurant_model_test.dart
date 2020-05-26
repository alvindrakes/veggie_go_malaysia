import 'package:flutter_test/flutter_test.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';

void main() {
  group('instantiation', () {
    test('name = null | \'\'', () {
      expect(
          () => Restaurant(name: null, latitude: 100.1423, longitude: 3.14232),
          throwsAssertionError);
      expect(() => Restaurant(name: '', address: '10 Downing Street'),
          throwsAssertionError);
    });
    test('either geolocation is given or address is given', () {
      expect(() => Restaurant(name: 'Veg House'), throwsAssertionError);
      expect(() => Restaurant(name: 'Veg House', address: '10a Riverside Ave'),
          returnsNormally);
      expect(
          () => Restaurant(
              name: 'Veg House', longitude: 10.213, latitude: 8.28193),
          returnsNormally);
      expect(
          () => Restaurant(name: 'a', longitude: 4.212), throwsAssertionError);
      expect(() => Restaurant(name: 'a', latitude: 423.0212),
          throwsAssertionError);
    });
  });

  group('distanceFromUser', () {
    // TODO: once distanceFromUser() has been implemented
  });
}
