import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/extension/context_extension.dart';
import 'package:uni_social/core/widgets/buttons/custom_elevated_button.dart';
import 'package:uni_social/core/widgets/custom_card_auth.dart';
import 'package:uni_social/core/widgets/inputs/input_base.dart';
import 'package:uni_social/core/widgets/space/smart_padding.dart';
import 'package:uni_social/core/widgets/space/space.dart';
import 'package:uni_social/feature/constants/assets.dart';
import 'package:uni_social/feature/router/app_router.dart';
import 'package:uni_social/feature/router/app_router.gr.dart';
import 'package:uni_social/translations/locale_keys.g.dart';

import 'package:uni_social/core/widgets/background_asset.dart';

@RoutePage()
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
    const selectedDomain = '@karabuk.edu.tr'; // Varsayılan domain

    // Seçilebilir domain listesi
    final domains = <String>[
      // "@boun.edu.tr", // Boğaziçi Üniversitesi
      // "@itu.edu.tr", // İstanbul Teknik Üniversitesi
      // "@metu.edu.tr", // Orta Doğu Teknik Üniversitesi (ODTÜ)
      // "@hacettepe.edu.tr", // Hacettepe Üniversitesi
      // "@ankara.edu.tr", // Ankara Üniversitesi
      // "@gsu.edu.tr", // Galatasaray Üniversitesi      "@gsu.edu.tr", // Galatasaray Üniversitesi
      // "@gsu.edu.tr", // Galatasaray Üniversitesi
      // "@gsu.edu.tr", // Galatasaray Üniversitesi
      // "@gsu.edu.tr", // Galatasaray Üniversitesi
      // "@istanbul.edu.tr", // İstanbul Üniversitesi
      // "@bilkent.edu.tr", // Bilkent Üniversitesi
      // "@sabanciuniv.edu", // Sabancı Üniversitesi
      // "@ku.edu.tr", // Koç Üniversitesi
      '@deu.edu.tr', // Dokuz Eylül Üniversitesi
      '@karabuk.edu.tr', // Karabük Üniversitesi
      '@yildiz.edu.tr', // Yıldız Teknik Üniversitesi
      // "@selcuk.edu.tr", // Selçuk Üniversitesi
      // "@cankaya.edu.tr", // Çankaya Üniversitesi
    ];

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
                  //!Input Area
                  Column(
                    children: [
                      _MailRow(
                        mailController: mailController,
                        selectedDomain: selectedDomain,
                        domains: domains,
                      ),
                      Space(),
                      InputBase(
                        textFFType: InputEnum.phone,
                        textEditingController: phoneController,
                      ),
                      Space(),
                      InputBase(
                        textFFType: InputEnum.username,
                        textEditingController: usernameController,
                      ),
                    ],
                  ),

                  //!Button Area
                  Column(
                    children: [
                      CustomElevatedButton(
                        child: Text(LocaleKeys.signUpViewElevatedButton.tr()),
                        onPressed: () {
                          router.push(const MailConfirmationRoute());
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          router.push(const UniRoute());
                        },
                        child: Text(LocaleKeys.signUpViewTextButton.tr()),
                      ),
                    ],
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

class _MailRow extends StatelessWidget {
  const _MailRow({
    required this.mailController,
    required this.selectedDomain,
    required this.domains,
    super.key,
  });

  final TextEditingController mailController;
  final String selectedDomain;
  final List<String> domains;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: InputBase(
            outlineInputBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
            ),
            hintText: LocaleKeys.signUpViewMailHintText.tr(),
            textFFType: InputType.basic,
            textEditingController: mailController,
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: DropdownSearch(
              selectedItem: selectedDomain,
              compareFn: (item1, item2) => true,
              items: (filter, loadProps) => domains,
              dropdownBuilder: (context, selectedItem) => Text(
                '$selectedItem',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.h,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              popupProps: const PopupProps.menu(
                fit: FlexFit.loose,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
