import 'package:flutter/material.dart';

enum SpaceType { vertical, horizontal }

enum SpaceValue { xs10, s20, m30, l40, xl50, xxl100 }

class Space extends StatelessWidget {
  SpaceValue spaceValue;
  SpaceType spaceType;
  late double space;

  Space({super.key, required this.spaceValue, required this.spaceType});

  @override
  Widget build(BuildContext context) {
    switch (spaceValue) {
      case SpaceValue.xs10:
        space = 10;
        break;
      case SpaceValue.s20:
        space = 20;
        break;
      case SpaceValue.m30:
        space = 30;
        break;
      case SpaceValue.l40:
        space = 40;
        break;
      case SpaceValue.xl50:
        space = 50;
        break;
      case SpaceValue.xxl100:
        space = 100;
        break;
      default:
    }
    return SizedBox(
      width: spaceType == SpaceType.horizontal ? space : null,
      height: spaceType == SpaceType.vertical ? space : null,
    );
  }
}
