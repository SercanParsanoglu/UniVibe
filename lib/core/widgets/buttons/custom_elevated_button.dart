// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/constants/colors.dart';

enum CustomElevatedButtonEnum {
  normalBtn,
  deletedBtn,
  smallBtn,
  whiteBtn,
}

mixin CustomElevatedButtonType {
  static const normalButton = CustomElevatedButtonEnum.normalBtn;
  static const smallBtn = CustomElevatedButtonEnum.smallBtn;
  static const deletedBtn = CustomElevatedButtonEnum.deletedBtn;
  static const whiteBtn = CustomElevatedButtonEnum.whiteBtn;
}

/// The `CustomElevatedButton` class is a custom button widget in Dart that allows customization of button appearance and behavior.

// ignore: must_be_immutable
class CustomElevatedButton extends StatefulWidget {
  final Widget btnText;
  bool alignCenter;
  final CustomElevatedButtonEnum customElevatedButtonType;
  final VoidCallback? onPressed;
  final double? padding;

  CustomElevatedButton({
    super.key,
    this.padding,
    this.onPressed,
    this.alignCenter = true,
    required this.btnText,
    required this.customElevatedButtonType,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  Color? btnColor;
  Function? onPress;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _updateButtonColor();
    return Container(
      alignment: widget.alignCenter ? Alignment.center : Alignment.centerRight,
      margin: widget.alignCenter
          ? const EdgeInsets.all(0)
          : EdgeInsets.symmetric(horizontal: 10.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: widget.customElevatedButtonType ==
                  CustomElevatedButtonEnum.whiteBtn
              ? MyColors.midnightBlue
              : MyColors.midnightBlue,
          backgroundColor: btnColor,
          fixedSize: widget.customElevatedButtonType ==
                  CustomElevatedButtonEnum.smallBtn
              ? Size(176.5.w, 60.h)
              : Size(373.w, 60.h),
        ),
        onPressed: () {
          widget.onPressed != null ? widget.onPressed!() : null;
          _updateButtonColor();
        },
        child: Center(
          child: widget.btnText,
        ),
      ),
    );
  }

  void _updateButtonColor() {
    switch (widget.customElevatedButtonType) {
      case CustomElevatedButtonEnum.normalBtn:
        btnColor = WidgetColors.elevatedButtonMainColorLight;
        break;
      case CustomElevatedButtonEnum.smallBtn:
        widget.alignCenter = false;

        break;
      case CustomElevatedButtonEnum.deletedBtn:
        btnColor = MyColors.red1;

        break;
      case CustomElevatedButtonEnum.whiteBtn:
        btnColor = MyColors.warmGrey4;

        break;
    }
  }
}
