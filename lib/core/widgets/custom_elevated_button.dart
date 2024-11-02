import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback? onPressed;
  Widget child;
  CustomElevatedButton({super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.teal2,
          ),
          child: child),
    );
  }
}
