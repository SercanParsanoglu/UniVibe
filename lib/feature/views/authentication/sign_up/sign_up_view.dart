import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/extension/context_extension.dart';
import 'package:uni_social/core/extension/theme_extension.dart';
import 'package:uni_social/core/widgets/space/space.dart';
import 'package:uni_social/feature/router/app_router.gr.dart';
import 'package:uni_social/core/widgets/custom_elevated_button.dart';
import 'package:uni_social/core/widgets/inputs/input_base.dart';
import 'package:uni_social/feature/constants/assets.dart';
import 'package:uni_social/feature/router/app_router.dart';

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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: Theme.of(context).cleanHeightWithAppbar,
          ),
          child: Stack(
            children: [
              const _Background(),
              Padding(
                padding: context.paddingLow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 500.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.9), // Gölge rengi
                            spreadRadius: 10, // Gölgenin yayılma miktarı
                            blurRadius: 50, // Gölgenin bulanıklık seviyesi
                            offset: const Offset(
                              0,
                              4,
                            ), // Gölgenin yerleşimi (x, y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: context.paddingLow,
                        child: Column(
                          children: [
                            Space(
                              spaceValue: SpaceValue.xl50,
                              spaceType: SpaceType.vertical,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: InputBase(
                                    outlineInputBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                    ),
                                    hintText: 'Mail adresi',
                                    textFFType: InputType.basic,
                                    textEditingController: mailController,
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: DropdownSearch(
                                      selectedItem: selectedDomain,
                                      compareFn: (item1, item2) => true,
                                      items: (filter, loadProps) => domains,
                                      dropdownBuilder:
                                          (context, selectedItem) => Text(
                                        '$selectedItem',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
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
                            ),
                            Space(
                              spaceValue: SpaceValue.xs10,
                              spaceType: SpaceType.vertical,
                            ),
                            InputBase(
                              textFFType: InputEnum.phone,
                              textEditingController: phoneController,
                            ),
                            Space(
                              spaceValue: SpaceValue.xs10,
                              spaceType: SpaceType.vertical,
                            ),
                            InputBase(
                              textFFType: InputEnum.username,
                              textEditingController: usernameController,
                            ),
                            Space(
                              spaceValue: SpaceValue.xs10,
                              spaceType: SpaceType.vertical,
                            ),
                            CustomElevatedButton(
                              child: const Text('Kayıt ol'),
                              onPressed: () {
                                router.push(const MailConfirmationRoute());
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                router.push(const UniRoute());
                              },
                              child: const Text('Üniversitemde istiyorum.'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      CustomAssets.onboardBackground,
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight -
          ScreenUtil().statusBarHeight -
          AppBar().preferredSize.height,
      fit: BoxFit.cover,
    );
  }
}
