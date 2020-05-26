import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/main.dart';

void main() {
  //added default windows size for widget to render
  // https://stackoverflow.com/questions/53706569/how-to-test-flutter-widgets-on-different-screen-sizes/53707065#53707065
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  binding.window.physicalSizeTestValue = Size(1200, 1980);
  binding.window.devicePixelRatioTestValue = 1.0;
  //---------//

  testWidgets('App should work', (tester) async {
    Logger.level = Level.info;
    setupLocator();
    await tester.pumpWidget(App());
    await tester.pumpAndSettle(const Duration(milliseconds: 200));
  });
}
