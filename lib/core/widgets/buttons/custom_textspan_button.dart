import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';
import '../../extension/theme_extension.dart';

/// The `CustomTextSpanButton` class is a custom button widget in Dart that displays two text spans, one in white and one in blue, and triggers a callback when pressed.

class CustomTextSpanButton extends StatelessWidget {
  final String whiteText;
  final String blueText;
  final VoidCallback onPressed;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final TextAlign textAlign;

  const CustomTextSpanButton(
      {super.key,
      required this.whiteText,
      required this.blueText,
      required this.onPressed,
      this.textAlign = TextAlign.center,
      this.alignment = Alignment.center,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: onPressed,
        child: Container(
          padding: padding,
          alignment: alignment,
          child: RichText(
            textAlign: textAlign,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: whiteText,
                  style: Theme.of(context).textTheme.titleMedium!,
                ),
                const TextSpan(text: " "),
                TextSpan(
                  text: blueText,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color:MyColors.softPink),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
