import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/ui/views/startup/startup_viewmodel.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* 
    1. Setup for screenutil, only needed once here
    2. screen resolution (in px) according to iPhone 11 pro max
    */
    ScreenUtil.init(context, width: 1242, height: 2688, allowFontScaling: true);

    return ViewModelBuilder<StartupViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.setup(),
    );
  }
}
