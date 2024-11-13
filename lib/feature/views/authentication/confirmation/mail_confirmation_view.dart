import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/functions/show_sheet/show_sheet_view.dart';
import 'package:uni_social/core/widgets/buttons/custom_textspan_button.dart';
import 'package:uni_social/core/widgets/inputs/input_base.dart';
import 'package:uni_social/core/widgets/modal_bottom_sheet/view_modal_bottom_sheet.dart';
import 'package:uni_social/core/widgets/space/smart_padding.dart';
import 'package:uni_social/core/widgets/space/space.dart';
import 'package:uni_social/feature/router/app_router.dart';
import 'package:uni_social/feature/router/app_router.gr.dart';
import 'package:uni_social/feature/views/modal_bottom_sheet/edit_email_signup_mbs..dart';
import 'package:uni_social/translations/locale_keys.g.dart';

///The page where the verification code is entered after registration
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
      body: SingleChildScrollViewWithSmartPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.mailConfirmationViewTextSendMail.tr(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0.h),
                        child: Text(
                          LocaleKeys.mailConfirmationViewTextControlMail.tr(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                InputBase(
                  onCompleted: (val) {
                    if (val == '123456') {
                      router.push(const SignUpUserDetailRoute());
                    }
                  },
                  textEditingController: _controller,
                  textFFType: InputType.digit,
                ),
                Space(),
                CustomTextSpanButton(
                  whiteText:
                      LocaleKeys.mailConfirmationViewSpanButtonWhite.tr(),
                  blueText: LocaleKeys.mailConfirmationViewSpanButtonBlue.tr(),
                  onPressed: () async {
                    showSheetView(
                      context,
                      ViewModalBottomSheet(
                        childPage: EditEmailSignupMBS(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
