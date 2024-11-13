import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/extension/context_extension.dart';

///For scrollable pages, a smart padding to give the first page size as the screen size
class SingleChildScrollViewWithSmartPadding extends StatelessWidget {
  const SingleChildScrollViewWithSmartPadding({required this.child, super.key});

  ///Widget for SingleCSW child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          height: context.screenHeightWithAppBar,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            top: 88.0.h,
            bottom: Platform.isIOS ? 41.0.h : 10.0.h,
          ),
          child: child,
        ),
      ),
    );
  }
}
