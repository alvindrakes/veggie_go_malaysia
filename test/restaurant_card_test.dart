import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/services/mock_image_test.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/restaurant_card/restaurant_card.dart';

import 'widget_wrapper.dart';

void main() {
  setupLocator();

  testWidgets('Restaurant Card shows correct information given the right data',
      (WidgetTester tester) async {
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(testableWidget(
          child: RestaurantCard(
        restaurant: Restaurant(
          name: 'abc restaurant',
          address: '123, New York street',
          mainPhoto: NetworkImage(
              'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F593b2e4b31358e03e55a0e8c%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D634%26cropX2%3D2468%26cropY1%3D39%26cropY2%3D1874'),
          openingHours: {
            'open': '10am',
            'close': '5pm',
          },
          rating: 3.0,
        ),
      )));
    });

    // wait for distanceCalculation in viewmodel to finish
    await tester.pumpAndSettle();

    // find Text widgets in card
    final restaurantName = find.text('abc restaurant');
    final address = find.text('123, New York street');
    final businessHours = find.text('10am to 5pm');
    final distanceFromUser = find.text('1.2km');
    final mainPhoto = find.byKey(Key('restaurantPhoto'));
    final ratingStar = find.byKey(Key('ratingStar'));

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(restaurantName, findsOneWidget);
    expect(businessHours, findsOneWidget);
    expect(distanceFromUser, findsOneWidget);
    expect(address, findsOneWidget);
    expect(mainPhoto, findsOneWidget);
    expect(ratingStar, findsOneWidget);
  });

  testWidgets('Preset text is shown if given data is empty | null',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testableWidget(
          child: RestaurantCard(
        restaurant: Restaurant(
          name: '  ',
          address: ' ',
          mainPhoto: null,
          openingHours: {
            'open': '  ',
            'close': ' ',
          },
          rating: null,
        ),
      )),
    );

    await tester.pumpAndSettle();

    final restaurantName = find.text('No name found');
    final mainPhoto = find.byKey(Key('restaurantPhoto'));
    final address = find.text('No address found');
    final businessHours = find.text(' - ');
    final distanceFromUser = find.text('1.2km');
    final ratingStar = find.byKey(Key('ratingStar'));

    expect(restaurantName, findsOneWidget);
    expect(address, findsOneWidget);
    expect(businessHours, findsOneWidget);
    expect(mainPhoto, findsOneWidget);
    expect(distanceFromUser, findsOneWidget);
    expect(ratingStar, findsOneWidget);
  });
}
