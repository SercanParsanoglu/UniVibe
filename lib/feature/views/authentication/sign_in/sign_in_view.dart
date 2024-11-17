import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/constants/colors.dart';
import 'package:uni_social/core/extension/context_extension.dart';
import 'package:uni_social/core/widgets/background_asset.dart';
import 'package:uni_social/core/widgets/buttons/custom_elevated_button.dart';
import 'package:uni_social/core/widgets/buttons/custom_text_button.dart';
import 'package:uni_social/core/widgets/custom_card_auth.dart';
import 'package:uni_social/core/widgets/inputs/input_base.dart';
import 'package:uni_social/core/widgets/space/smart_padding.dart';
import 'package:uni_social/core/widgets/space/space.dart';
import 'package:uni_social/feature/constants/assets.dart';
import 'package:uni_social/translations/locale_keys.g.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  @override
  void initState() {
    // TODO: implement initState
    usernameController = TextEditingController();
    passwordController = TextEditingController();
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    LocaleKeys.signInViewWelcomeText.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: MyColors.teal2),
                  ),
                  Column(
                    children: [
                      InputBase(
                        textFFType: InputType.email,
                        textEditingController: usernameController,
                      ),
                      Space(),
                      InputBase(
                        textFFType: InputType.password,
                        textEditingController: passwordController,
                      ),
                      CustomTextButton(
                        btnText:
                            LocaleKeys.signInViewRememberPasswordButton.tr(),
                        alignCenter: false,
                        btnPositionLeft: false,
                        onPressed: () {
                          print('Remember password button clicked');
                        },
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    child: Text(
                      LocaleKeys.signInViewElevatedButton.tr(),
                    ),
                    onPressed: () {},
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
