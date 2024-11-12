import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///default padding values to provide a certain order in ui

extension PaddingExtension on BuildContext {
  ///Low padding for each direction

  EdgeInsets get paddingLow => const EdgeInsets.all(10);

  ///Medium padding for each direction

  EdgeInsets get paddingMedium => const EdgeInsets.all(20);

  ///High padding for each direction

  EdgeInsets get paddingHigh => const EdgeInsets.all(40);

  ///View heigh with app bar

  double get screenHeightWithAppBar =>
      ScreenUtil().screenHeight - ScreenUtil().statusBarHeight - 60.h;
}
