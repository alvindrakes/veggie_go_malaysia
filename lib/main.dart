import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/app/router.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';

void main() {
  Logger.level = Level.info;

  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Veggie Go Malaysia',

      // We can use both material and cupertino widgets now under CupertinoApp
      // https://medium.com/@sendtosaeed2/flutter-material-cupertino-make-together-a3d2d7849548
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      initialRoute: Routes.startupViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: ThemeColors.background,
      ),
    );
  }
}
