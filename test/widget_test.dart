import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/main.dart';

void main() {
  testWidgets('App should work', (tester) async {
    Logger.level = Level.info;
    setupLocator();
    await tester.pumpWidget(App());
    await tester.pumpAndSettle(const Duration(milliseconds: 200));
  });
}
