/// The `Space` class in Dart is a widget that creates a space of specified size and type (vertical or
/// horizontal) in a Flutter application.
library;

import 'package:flutter/material.dart';

/// The `enum SpaceType { vertical, horizontal }` in the Dart code snippet is defining an enumeration
/// type called `SpaceType` with two possible values: `vertical` and `horizontal`. This enum is used to
/// specify the type of space (either vertical or horizontal) that the `Space` widget will create in a
/// Flutter application. By using an enum, it provides a way to restrict the possible values for
/// `SpaceType` to only `vertical` and `horizontal`, making the code more readable and maintainable.
enum SpaceType { vertical, horizontal }

enum SpaceValue { xs10, s20, m30, l40, xl50, xxl100 }

class Space extends StatelessWidget {
  Space({
    this.spaceValue = SpaceValue.xs10,
    this.spaceType = SpaceType.vertical,
    super.key,
  });
  SpaceValue spaceValue;
  SpaceType spaceType;
  late double space;

  @override
  Widget build(BuildContext context) {
    switch (spaceValue) {
      case SpaceValue.xs10:
        space = 10;
      case SpaceValue.s20:
        space = 20;
      case SpaceValue.m30:
        space = 30;
      case SpaceValue.l40:
        space = 40;
      case SpaceValue.xl50:
        space = 50;
      case SpaceValue.xxl100:
        space = 100;
      default:
    }
    return SizedBox(
      width: spaceType == SpaceType.horizontal ? space : null,
      height: spaceType == SpaceType.vertical ? space : null,
    );
  }
}
