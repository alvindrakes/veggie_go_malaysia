import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

class _Wrapper extends StatelessWidget {
  final Widget child;
  _Wrapper(this.child);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1125, height: 2436, allowFontScaling: true);
    return child;
  }
}

Widget testableWidget({Widget child}) {
  //For some readon widget tests only works after adding a default windows size
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  binding.window.physicalSizeTestValue = Size(1200, 1980);
  binding.window.devicePixelRatioTestValue = 1.0;

  //-----------//

  return Directionality(
    textDirection: TextDirection.ltr,
    child: MediaQuery(
      data: MediaQueryData(),
      child: CupertinoApp(
        home: Scaffold(body: _Wrapper(child)),
      ),
    ),
  );
}
