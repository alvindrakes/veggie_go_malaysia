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
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Veggie Go Malaysia',
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
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
