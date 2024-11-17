import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/extension/context_extension.dart';

class CustomCardAuth extends StatelessWidget {
  CustomCardAuth({
    required this.child,
    super.key,
  });
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Arka plan rengi
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ), // Kenarları yuvarlatma
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.9), // Gölge rengi
                  spreadRadius: 10, // Gölgenin yayılma miktarı
                  blurRadius: 50, // Gölgenin bulanıklık seviyesi
                  offset: const Offset(
                    0,
                    4,
                  ), // Gölgenin yerleşimi (x, y)
                ),
              ],
            ),
            child: Padding(
              padding: context.paddingLow,
              child: Container(
                constraints: BoxConstraints(minHeight: 400.h),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
