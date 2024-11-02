import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ThemeExtension on ThemeData {
  double get cleanHeightWithAppbar {
    return ScreenUtil().screenHeight -
        ScreenUtil().statusBarHeight -
        AppBar().preferredSize.height;
  }

  double get cleanWidth {
    return ScreenUtil().screenWidth;
  }
}
