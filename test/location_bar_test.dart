import 'package:flutter_test/flutter_test.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/location_bar.dart';

import 'widget_wrapper.dart';

void main() {
  testWidgets('testingLocationBar', (WidgetTester tester) async {
    await tester.pumpWidget(testableWidget(child: FlagSelector()));
  });
}
