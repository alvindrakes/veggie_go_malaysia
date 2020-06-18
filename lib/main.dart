import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/locator.dart';
import 'app/router.dart';
import 'constants/colors.dart';

void main() {
  Logger.level = Level.info;

  setupLocator();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN')],
      path: 'assets/languages',
      useOnlyLangCode: true,
      startLocale:
          Locale('zh', 'CN'), // just to test whether localization is working
      fallbackLocale: Locale('en', 'US'),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "Veggie Go Malaysia",
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Routes.startupViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: CupertinoThemeData(
        primaryColor: ThemeColors.brightGreen,
        scaffoldBackgroundColor: ThemeColors.background,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'Lato'),
        ),
      ),
    );
  }
}
