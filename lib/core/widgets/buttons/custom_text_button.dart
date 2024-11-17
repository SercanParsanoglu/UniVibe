// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni_social/core/constants/colors.dart';

/// The `CustomTextButton` class is a customizable button widget in Dart that can be used to create buttons with various properties such as text, icon, alignment, color, and style.

class CustomTextButton extends StatelessWidget {
  final bool? networkCheck;
  final bool? isSnackBar;
  final bool? ignoring;
  final bool? btnPositionLeft;
  final bool? btnTextLeft;
  final VoidCallback? onPressed;
  final String btnText;
  final String? icon;
  final bool alignCenter;
  final Color? color;
  final TextStyle? customStyle;
  final bool? longBtn;

  const CustomTextButton({
    required this.btnText,
    super.key,
    this.networkCheck = false,
    this.isSnackBar = false,
    this.ignoring = false,
    this.btnPositionLeft,
    this.btnTextLeft,
    this.onPressed,
    this.icon,
    this.alignCenter = true,
    this.color,
    this.customStyle,
    this.longBtn = true,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor;
    if (color != null) {
      textColor = color!;
    } else {
      textColor = MyColors.midnightBlue;
    }

    return IgnorePointer(
      ignoring: ignoring ?? false,
      child: Container(
        height: 60.0.h,
        alignment: alignCenter
            ? Alignment.center
            : btnPositionLeft == false
                ? Alignment.centerRight
                : Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: alignCenter
            ? longBtn!
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      onTap: () async {
                        await _onPressedButton(context);
                      },
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (ignoring!)
                                // MyIcons().iconsCheck != null
                                //     ? SvgPicture.string(
                                //         MyIcons().iconsCheck!,
                                //         width: 18.sp,
                                //         color: Theme.of(context).brightness ==
                                //                 Brightness.light
                                //             ? WidgetColors
                                //                 .webViewSubTitleColorLight
                                //             : WidgetColors
                                //                 .webViewSubTitleColorDim,
                                //       )
                                //     :
                                const Placeholder(),
                              Text(
                                btnText,
                                overflow: TextOverflow.ellipsis,
                                style: customStyle ??
                                    Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: !ignoring!
                                              ? textColor
                                              : Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? MyColors.mustardYellow
                                                  : MyColors.neonGreen1,
                                        ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    onTap: () async {
                      await _onPressedButton(context);
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w,
                        ),
                        child: Text(
                          btnText,
                          overflow: TextOverflow.ellipsis,
                          style: customStyle ??
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: textColor,
                                  ),
                        ),
                      ),
                    ),
                  )
            : icon != null
                ? InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    onTap: () async {
                      await _onPressedButton(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.0.w,
                        top: 10.0.h,
                        bottom: 10.0.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0.r),
                            ),
                            constraints: BoxConstraints(
                              maxWidth: ScreenUtil().screenWidth - 44.w,
                            ),
                            child: Text(
                              btnText,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: textColor),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 24.h,
                            child: icon != ''
                                ? SvgPicture.string(
                                    icon!,
                                    height: 15.0.sp,
                                    color: textColor,
                                  )
                                : const Placeholder(),
                          ),
                        ],
                      ),
                    ),
                  )
                : longBtn == true && btnPositionLeft == true
                    ? InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        onTap: () async {
                          await _onPressedButton(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          height: 60.h,
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            child: Text(
                              btnText,
                              overflow: TextOverflow.ellipsis,
                              style: customStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: textColor,
                                      ),
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        onTap: () async {
                          await _onPressedButton(context);
                        },
                        child: Container(
                          margin: isSnackBar!
                              ? null
                              : EdgeInsets.only(left: 10.w, right: 10.w),
                          // height: 60.0.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                btnText,
                                style: customStyle ??
                                    Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: textColor,
                                        ),
                              ),
                            ],
                          ),
                        ),
                      ),
      ),
    );
  }

  _onPressedButton(BuildContext context) async {
    print('qqqq');
    // final connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult == ConnectivityResult.none && networkCheck!) {
    //   // ignore: use_build_context_synchronously
    //   customSnackBar(
    //       context: context,
    //       onPressed: () async {
    //         await _onPressedButton(context);
    //       });
    // } else {
    //   onPressed!();
    // }
  }
}
