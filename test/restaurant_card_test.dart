import 'package:flutter_test/flutter_test.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/restaurant_card/restaurant_card.dart';

import 'widget_wrapper.dart';

void main() {
  //TODO add test for image
  testWidgets('Restaurant Card shows correct information given the right data',
      (WidgetTester tester) async {
    await tester.pumpWidget(testableWidget(
        child: RestaurantCard(
      restaurant: Restaurant(
        name: 'abc restaurant',
        address: '123, New York street',
        openingHours: {
          'open': '10am',
          'close': '5pm',
        },
      ),
    )));

    // wait for distanceCalculation in viewmodel to finish
    await tester.pumpAndSettle();

    // find Text widgets in card
    final restaurantName = find.text('abc restaurant');
    final address = find.text('123, New York street');
    final businessHours = find.text('10am to 5pm');
    final distanceFromUser = find.text('1.2km');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(restaurantName, findsOneWidget);
    expect(businessHours, findsOneWidget);
    expect(distanceFromUser, findsOneWidget);
    expect(address, findsOneWidget);
  });

  testWidgets('Preset text is shown if given data is empty | null',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testableWidget(
          child: RestaurantCard(
        restaurant: Restaurant(
          name: '  ',
          address: ' ',
          openingHours: {
            'open': '  ',
            'close': ' ',
          },
        ),
      )),
    );

    await tester.pumpAndSettle();

    final restaurantName = find.text('No name found');

    final address = find.text('No address found');
    final businessHours = find.text(' - ');
    final distanceFromUser = find.text('1.2km');

    expect(restaurantName, findsOneWidget);
    expect(address, findsOneWidget);
    expect(businessHours, findsOneWidget);
    expect(distanceFromUser, findsOneWidget);
  });
}