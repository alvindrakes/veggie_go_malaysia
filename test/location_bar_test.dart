import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/location_bar.dart';

Widget makeTestableWidget({Widget child}) {
  return MaterialApp(
    home: child,
    builder: (BuildContext context, Widget widget) {
      ScreenUtil.init(context,
          width: 1125, height: 2436, allowFontScaling: true);
      return widget;
    },
  );
}

void main() {
  testWidgets('testingLocationBar', (WidgetTester tester) async {
    await tester.pumpWidget(
      makeTestableWidget(child: LocationSelector()),
    );
  });
}
