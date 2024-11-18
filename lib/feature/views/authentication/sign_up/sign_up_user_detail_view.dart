import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uni_social/core/extension/theme_extension.dart';
import 'package:uni_social/core/widgets/background_asset.dart';
import 'package:uni_social/core/widgets/buttons/custom_elevated_button.dart';
import 'package:uni_social/core/widgets/custom_card_auth.dart';
import 'package:uni_social/core/widgets/inputs/input_base.dart';
import 'package:uni_social/core/widgets/inputs/input_date.dart';
import 'package:uni_social/core/widgets/space/space.dart';
import 'package:uni_social/feature/constants/assets.dart';

import 'package:uni_social/core/widgets/space/smart_padding.dart';
import 'package:uni_social/translations/locale_keys.g.dart';

@RoutePage()
class SignUpUserDetailView extends StatefulWidget {
  const SignUpUserDetailView({super.key});

  @override
  State<SignUpUserDetailView> createState() => _SignUpUserDetailViewState();
}

class _SignUpUserDetailViewState extends State<SignUpUserDetailView> {
  final _formkey = GlobalKey<FormState>();

  late TextEditingController mailController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;

  @override
  void initState() {
    mailController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollViewWithSmartPadding(
        smartPadding: false,
        child: Stack(
          children: [
            BackgroundAsset(
              customAssets: CustomAssets.onboardBackground,
            ),
            CustomCardAuth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Space(
                    spaceValue: SpaceValue.m30,
                  ),
                  InputBase(
                    textFFType: InputEnum.basic,
                    textEditingController: phoneController,
                    hintText: LocaleKeys.signUpUserDetailViewNameHintText.tr(),
                  ),
                  Space(),
                  InputBase(
                    textFFType: InputEnum.basic,
                    textEditingController: phoneController,
                    hintText:
                        LocaleKeys.signUpUserDetailViewLastNameHintText.tr(),
                  ),
                  Space(),
                  InputBase(
                    textFFType: InputEnum.basic,
                    textEditingController: phoneController,
                    hintText:
                        LocaleKeys.signUpUserDetailViewUniDepHintText.tr(),
                  ),
                  Space(),
                  InputDate(
                    textEditingController: phoneController,
                  ),
                  Space(),
                  InputBase(
                    textFFType: InputEnum.gender,
                    genderItems: [
                      LocaleKeys.signUpUserDetailViewGenderInputVal1.tr(),
                      LocaleKeys.signUpUserDetailViewGenderInputVal2.tr(),
                      LocaleKeys.signUpUserDetailViewGenderInputVal3.tr(),
                    ],
                    textEditingController: phoneController,
                    hintText:
                        LocaleKeys.signUpUserDetailViewGenderHintText.tr(),
                  ),
                  Space(
                    spaceValue: SpaceValue.s20,
                  ),
                  CustomElevatedButton(
                    child: Text(
                        LocaleKeys.signUpUserDetailViewElevatedButton.tr()),
                    onPressed: () {},
                  ),
                  Space(
                    spaceValue: SpaceValue.s20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
