import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/constants/colors.dart';
import 'package:uni_social/core/widgets/space/space.dart';
import 'package:uni_social/feature/model/uni_model.dart';

class UniCard extends StatelessWidget {
  const UniCard({required this.uni, super.key});
  final UniModel uni;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Container(
        decoration: const BoxDecoration(
          color: MyColors.teal3,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            children: [
              SizedBox(
                width: 150.w,
                child: ClipOval(
                  child: Image.asset(
                    'assets/uni_logo/${uni.UniLogoPath}.jpg',
                  ),
                ),
              ),
              Space(),
              Text(uni.UniName ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
