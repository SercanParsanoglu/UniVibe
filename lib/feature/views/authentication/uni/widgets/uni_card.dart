import 'package:flutter/material.dart';
import 'package:uni_social/core/widgets/space/space.dart';
import 'package:uni_social/feature/model/uni_model.dart';

class UniCard extends StatelessWidget {
  final UniModel uni;

  const UniCard({super.key, required this.uni});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipOval(
            child: Image.asset(
              "assets/uni_logo/${uni.UniLogoPath}.jpg",
            ),
          ),
        ),
        Space(spaceValue: SpaceValue.xs10, spaceType: SpaceType.vertical),
        Text(uni.UniName ?? "")
      ],
    );
  }
}
