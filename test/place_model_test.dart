import 'package:flutter_test/flutter_test.dart';
import 'package:veggie_go_malaysia/datamodels/place.dart';

void main() {
  group('instantiation', () {
    test('name = null | \'\'', () {
      expect(() => Place(name: null, latitude: 100.1423, longitude: 3.14232),
          throwsAssertionError);
      expect(() => Place(name: '', address: '10 Downing Street'),
          throwsAssertionError);
    });
    test('either geolocation is given or address is given', () {
      expect(() => Place(name: 'Veg House'), throwsAssertionError);
      expect(() => Place(name: 'Veg House', address: '10a Riverside Ave'),
          returnsNormally);
      expect(
          () => Place(name: 'Veg House', longitude: 10.213, latitude: 8.28193),
          returnsNormally);
      expect(() => Place(name: 'a', longitude: 4.212), throwsAssertionError);
      expect(() => Place(name: 'a', latitude: 423.0212), throwsAssertionError);
    });
  });

  group('distanceFromUser', () {
    //
  });
}
