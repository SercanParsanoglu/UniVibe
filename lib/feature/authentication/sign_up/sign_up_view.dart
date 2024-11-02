import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/extension/theme_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/inputs/input_base.dart';

@RoutePage()
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedDomain = "@karabuk.edu.tr"; // Varsayılan domain

    // Seçilebilir domain listesi
    final List<String> domains = [
      "@boun.edu.tr", // Boğaziçi Üniversitesi
      "@itu.edu.tr", // İstanbul Teknik Üniversitesi
      "@metu.edu.tr", // Orta Doğu Teknik Üniversitesi (ODTÜ)
      "@hacettepe.edu.tr", // Hacettepe Üniversitesi
      "@ankara.edu.tr", // Ankara Üniversitesi
      "@gsu.edu.tr", // Galatasaray Üniversitesi      "@gsu.edu.tr", // Galatasaray Üniversitesi
      "@gsu.edu.tr", // Galatasaray Üniversitesi
      "@gsu.edu.tr", // Galatasaray Üniversitesi
      "@gsu.edu.tr", // Galatasaray Üniversitesi
      "@istanbul.edu.tr", // İstanbul Üniversitesi
      "@bilkent.edu.tr", // Bilkent Üniversitesi
      "@sabanciuniv.edu", // Sabancı Üniversitesi
      "@ku.edu.tr", // Koç Üniversitesi
      "@deu.edu.tr", // Dokuz Eylül Üniversitesi
      "@karabuk.edu.tr", // Karabük Üniversitesi
      "@yildiz.edu.tr", // Yıldız Teknik Üniversitesi
      "@selcuk.edu.tr", // Selçuk Üniversitesi
      "@cankaya.edu.tr", // Çankaya Üniversitesi
    ];

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
                height: Theme.of(context).cleanHeightWithAppbar),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/canva2.png",
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().screenHeight -
                      ScreenUtil().statusBarHeight -
                      AppBar().preferredSize.height,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 500.h,
                      decoration: BoxDecoration(
                        color: Colors.white, // Arka plan rengi
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ), // Kenarları yuvarlatma
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // Gölge rengi
                            spreadRadius: 2, // Gölgenin yayılma miktarı
                            blurRadius: 10, // Gölgenin bulanıklık seviyesi
                            offset:
                                const Offset(0, 4), // Gölgenin yerleşimi (x, y)
                          ),
                        ],
                      ),
                      // height: 300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Hoşgeldin",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: MyColors.teal2),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          DropdownButtonFormField(
                            value: selectedDomain,
                            items: domains.map((String domain) {
                              return DropdownMenuItem<String>(
                                value: domain,
                                child: Text(domain),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                          CustomElevatedButton(
                            child: const Text("Giriş yap"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
