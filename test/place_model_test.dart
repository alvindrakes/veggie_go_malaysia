import 'package:flutter_test/flutter_test.dart';
import 'package:veggie_go_malaysia/datamodels/place.dart';

void main() {
  group('instantiation', () {
    final documentID = '1';
    test('name = null | \'\'', () {
      expect(
          () => Place(
                name: null,
                latitude: 100.1423,
                longitude: 3.14232,
                documentID: documentID,
              ),
          throwsAssertionError);
      expect(
          () => Place(
                name: '',
                address: '10 Downing Street',
                documentID: documentID,
              ),
          throwsAssertionError);
    });
    test('either geolocation is given or address is given', () {
      expect(
          () => Place(
                name: 'Veg House',
                documentID: documentID,
              ),
          throwsAssertionError);
      expect(
          () => Place(
                name: 'Veg House',
                documentID: documentID,
                address: '10a Riverside Ave',
              ),
          returnsNormally);
      expect(
          () => Place(
              name: 'Veg House',
              documentID: documentID,
              longitude: 10.213,
              latitude: 8.28193),
          returnsNormally);
      expect(
          () => Place(
                name: 'a',
                longitude: 4.212,
                documentID: documentID,
              ),
          throwsAssertionError);
      expect(
          () => Place(
                name: 'a',
                documentID: documentID,
                latitude: 423.0212,
              ),
          throwsAssertionError);
    });
  });

  group('distanceFromUser', () {
    //
  });
}
