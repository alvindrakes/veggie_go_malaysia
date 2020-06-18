import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/main.dart';
import 'package:veggie_go_malaysia/services/mock_image_test.dart';

void main() {
  setupLocator();
  testWidgets('App should work', (tester) async {
    Logger.level = Level.info;

    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN')],
          path: 'assets/languages',
          useOnlyLangCode: true,
          fallbackLocale: Locale('en', 'US'),
          child: App(),
        ),
      );
      // await tester.pumpAndSettle(const Duration(milliseconds: 200));
    });
  });
}
