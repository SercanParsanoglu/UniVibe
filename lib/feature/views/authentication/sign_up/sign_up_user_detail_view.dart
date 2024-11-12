import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/extension/context_extension.dart';
import 'package:uni_social/core/extension/theme_extension.dart';
import 'package:uni_social/core/widgets/space/space.dart';
import 'package:uni_social/feature/router/app_router.gr.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/inputs/input_base.dart';
import '../../../../core/widgets/inputs/input_date.dart';
import '../../../constants/assets.dart';
import '../../../router/app_router.dart';

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
    String selectedDomain = "@karabuk.edu.tr"; // Varsayılan domain

    // Seçilebilir domain listesi
    final List<String> domains = [
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
      "@deu.edu.tr", // Dokuz Eylül Üniversitesi
      "@karabuk.edu.tr", // Karabük Üniversitesi
      "@yildiz.edu.tr", // Yıldız Teknik Üniversitesi
      // "@selcuk.edu.tr", // Selçuk Üniversitesi
      // "@cankaya.edu.tr", // Çankaya Üniversitesi
    ];

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
                height: Theme.of(context).cleanHeightWithAppbar),
            child: Stack(
              children: [
                const _Background(),
                Padding(
                  padding: context.paddingLow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.9), // Gölge rengi
                              spreadRadius: 10, // Gölgenin yayılma miktarı
                              blurRadius: 50, // Gölgenin bulanıklık seviyesi
                              offset: const Offset(
                                  0, 4), // Gölgenin yerleşimi (x, y)
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: context.paddingLow,
                          child: Column(
                            children: [
                              Space(
                                  spaceValue: SpaceValue.xl50,
                                  spaceType: SpaceType.vertical),
                              Space(
                                  spaceValue: SpaceValue.xs10,
                                  spaceType: SpaceType.vertical),
                              InputBase(
                                textFFType: InputEnum.basic,
                                textEditingController: phoneController,
                                hintText: "İsim",
                              ),
                              Space(
                                  spaceValue: SpaceValue.xs10,
                                  spaceType: SpaceType.vertical),
                              InputBase(
                                textFFType: InputEnum.basic,
                                textEditingController: phoneController,
                                hintText: "Soyisim",
                              ),
                              Space(
                                  spaceValue: SpaceValue.xs10,
                                  spaceType: SpaceType.vertical),
                              InputBase(
                                textFFType: InputEnum.basic,
                                textEditingController: phoneController,
                                hintText: "Üniversite bölümü",
                              ),
                              Space(
                                  spaceValue: SpaceValue.xs10,
                                  spaceType: SpaceType.vertical),
                              InputDate(
                                textEditingController: phoneController,
                              ),
                              // InputBase(
                              //   textFFType: InputEnum.basic,
                              //   textEditingController: phoneController,
                              //   hintText: "Doğum tarihi",
                              // ),
                              Space(
                                  spaceValue: SpaceValue.xs10,
                                  spaceType: SpaceType.vertical),
                              InputBase(
                                textFFType: InputEnum.gender,
                                genderItems: const ["Kadın", "Erkek", "Özel"],
                                textEditingController: phoneController,
                                hintText: "Cinsiyet",
                              ),
                              Space(
                                  spaceValue: SpaceValue.s20,
                                  spaceType: SpaceType.vertical),
                              CustomElevatedButton(
                                child: const Text("Devam et"),
                                onPressed: () {},
                              ),
                              Space(
                                  spaceValue: SpaceValue.s20,
                                  spaceType: SpaceType.vertical),
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
        ));
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
