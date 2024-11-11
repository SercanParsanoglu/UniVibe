// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ViewModalBottomSheet extends StatefulWidget {
  Widget childPage;
  ViewModalBottomSheet({
    super.key,
    required this.childPage,
  });

  @override
  State<ViewModalBottomSheet> createState() => _ViewModalBottomSheetState();
}

class _ViewModalBottomSheetState extends State<ViewModalBottomSheet> {
  double initialChildSize = 0.9;
  final GlobalKey widgetKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double widgetHeight =
          (widgetKey.currentContext?.findRenderObject() as RenderBox)
              .size
              .height;
      setState(() {
        initialChildSize = (widgetHeight) / ScreenUtil().screenHeight;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: initialChildSize < 0.9
          ? const NeverScrollableScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: BoxDecoration(
                // color: Theme.of(context).bottomSheetBackgroundColor,
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0.r),
              topRight: Radius.circular(25.0.r),
            )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              key: widgetKey,
              children: [
                SizedBox(
                  height: 5.0.h,
                ),
                Container(
                  decoration: const BoxDecoration(
                      // color: Theme.of(context).bottomSheetTopWidgetColor,
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  alignment: Alignment.center,
                  width: 63.w,
                  height: 5.h,
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      // color: Theme.of(context).bottomSheetBackgroundColor,
                    ),
                    child: widget.childPage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
