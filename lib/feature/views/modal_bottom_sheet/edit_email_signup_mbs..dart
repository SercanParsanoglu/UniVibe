// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/buttons/custom_elevated_button.dart';
import '../../../core/widgets/buttons/custom_text_button.dart';
import '../../../core/widgets/inputs/input_base.dart';

/// The `EditEmailSignupMBS` class is a Dart class that represents a widget for updating the user's email address in a mobile app.

class EditEmailSignupMBS extends StatelessWidget {
  final String? emailText;
  final String? formatedEmailText;
  EditEmailSignupMBS({
    super.key,
    this.formatedEmailText,
    this.emailText,
  });

  final FocusNode _phoneFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 39.h, horizontal: 10.w),
          child: Text(
            " AppLocalizations.of(context)!.updateYourEmail,",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "formatedEmailText {AppLocalizations.of(context)!.editEmail}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0.h),
            child: InputBase(
              // isM  bsWidget: true,
              // isSigninMail: false,
              textEditingController: _emailController,
              textFFType: InputType.email,
              // focusNode: _phoneFocusNode,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10.0.h, bottom: 20.0.h),
              child: CustomElevatedButton(
                btnText:
                    // locator.get<UserAuthViewModel>().editEmailSignupState ==
                    //         UserAuthEnum.idle
                    const Text("AppLocalizations.of(context)!.updateMyEmail"),
                // : Theme.of(context).buttonWhiteLoading,
                customElevatedButtonType: CustomElevatedButtonType.normalButton,
                onPressed: () async {
                  await _onPressed(context);
                },
              )),
          CustomTextButton(
            alignCenter: true,
            btnText: "AppLocalizations.of(context)!.iGaveUp",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: Platform.isIOS ? 30.0.h : 15.0.h,
          )
        ])
      ],
    );
  }

  _onPressed(BuildContext context) async {
    // final connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult == ConnectivityResult.none) {
    //   // ignore: use_build_context_synchronously
    //   customSnackBar(
    //       context: context,
    //       onPressed: () async {
    //         await _onPressed(context);
    //       });
    // } else {
    //   // ignore: use_build_context_synchronously
    //   await locator.get<UserAuthViewModel>().editEmailSignup(
    //       EditEmailModelReq(
    //           email: _emailController.text,
    //           otpKey: locator.get<UserAuthViewModel>().sigupResponse!.otpKey),
    //       context);
    //   // ignore: use_build_context_synchronously
    //   Navigator.pop(context);
    //   // ignore: use_build_context_synchronously
    //   //Navigator.pop(context);
    //   // ignore: use_build_context_synchronously
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => SmsDigitCodeScreen(
    //               text: _emailController.text,
    //               type: DigitCodeScreenEnum.email,
    //               isSigninMail: false,
    //               otpKey:
    //                   locator.get<UserAuthViewModel>().sigupResponse!.otpKey!,
    //             )),
    //   );
    // }
  }
}
