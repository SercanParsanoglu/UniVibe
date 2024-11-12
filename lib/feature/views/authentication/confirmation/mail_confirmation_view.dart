import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/extension/context_extension.dart';
import 'package:uni_social/core/functions/show_sheet/show_sheet_view.dart';
import 'package:uni_social/core/widgets/modal_bottom_sheet/view_modal_bottom_sheet.dart';
import 'package:uni_social/feature/router/app_router.dart';
import 'package:uni_social/feature/router/app_router.gr.dart';
import 'package:uni_social/feature/views/authentication/sign_up/sign_up_user_detail_view.dart';
import 'package:uni_social/feature/views/modal_bottom_sheet/edit_email_signup_mbs..dart';

import '../../../../core/widgets/buttons/custom_textspan_button.dart';
import '../../../../core/widgets/inputs/input_base.dart';

@RoutePage()
class MailConfirmationView extends StatefulWidget {
  const MailConfirmationView({super.key});

  @override
  State<MailConfirmationView> createState() => _MailConfirmationViewState();
}

class _MailConfirmationViewState extends State<MailConfirmationView> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: context.screenHeightWithAppBar,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 88.0.h,
                bottom: Platform.isIOS ? 41.0.h : 10.0.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0.w, bottom: 77.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sana bir mail gönderdik",
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0.h),
                              child: Text(
                                "2014010811004@karabuk.edu.tr mail adresini kontrol edip onay kodunu girebilirsin",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InputBase(
                        onCompleted: (val) {
                          if (val == "123456") {
                            router.push(const SignUpUserDetailRoute());
                          }
                        },
                        textEditingController: _controller,
                        textFFType: InputType.digit,
                        // digitType: digitType,
                      ),

                      CustomTextSpanButton(
                        padding: EdgeInsets.only(left: 10.w),
                        alignment: Alignment.centerLeft,
                        whiteText: "Mailimi yanlış girdim",
                        blueText: "Text",
                        onPressed: () async {
                          showSheetView(
                              context,
                              ViewModalBottomSheet(
                                  childPage: EditEmailSignupMBS()));
                        },
                      ),

                      //     CustomTimer(
                      //       onPressed: () async {
                      //         int status = -1;
                      //         //otp kodun telefona mı yoksa epostaya mı gönderileceğinin koşulu
                      //         if (type == SigninDigitCodeEnum.phone) {
                      //           await locator
                      //               .get<UserAuthViewModel>()
                      //               .sendAnotherSms(SendAnotherSmsModelReq(
                      //                   otpKey: otpKey, phoneNumber: phone));
                      //           status = locator
                      //               .get<UserAuthViewModel>()
                      //               .sendAnotherSmsModelRes!
                      //               .status!;
                      //         } else {
                      //           await locator
                      //               .get<UserAuthViewModel>()
                      //               .sendAnotherMail(SendAnotherMailModelReq(
                      //                   otpKey: otpKey, email: email));
                      //           status = locator
                      //               .get<UserAuthViewModel>()
                      //               .sendAnotherMailModelRes!
                      //               .status!;
                      //         }
                      //         if (status == 2) {
                      //           Navigator.pop(context);
                      //         }
                      //       },
                      //     ),
                      //     Observer(
                      //       builder: (context) {
                      //         return locator
                      //                         .get<OtpCodePhoneViewModel>()
                      //                         .otpCodePhoneState ==
                      //                     OtpCodePhoneAuthEnum.busy ||
                      //                 locator
                      //                         .get<OtpCodeEmailViewModel>()
                      //                         .otpCodeEmailState ==
                      //                     OtpCodeEmailAuthEnum.busy
                      //             ? SizedBox(
                      //                 height: 60.h,
                      //                 child: Theme.of(context).loadingIcon,
                      //               )
                      //             : Container();
                      //       },
                      //     ),
                      //   ],
                      // ),
                      // LegalInformationBottom(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
