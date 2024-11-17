import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:uni_social/feature/constants/assets.dart';

class BackgroundAsset extends StatelessWidget {
  BackgroundAsset({
   required this.customAssets,
    super.key,
  });
  String customAssets;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      customAssets,
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight -
          ScreenUtil().statusBarHeight -
          AppBar().preferredSize.height,
      fit: BoxFit.cover,
    );
  }
}
