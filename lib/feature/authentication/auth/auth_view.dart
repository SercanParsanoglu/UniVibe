import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uni_social/core/constants/colors.dart';
import 'package:uni_social/core/widgets/custom_elevated_button.dart';
import 'package:uni_social/feature/router/app_router.dart';
import 'package:uni_social/feature/router/app_router.gr.dart';
import 'package:uni_social/translations/locale_keys.g.dart';

@RoutePage()
class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.uniDating.tr()),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/canva2.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  // LottieBuilder.asset("assets/images/auth_image.json"),
                  // Expanded(child: Container()),
                  // Text(
                  //   "Üniversite hayatına renk kat! Yeni arkadaşlarla tanış, sosyal çevreni genişlet. Hesabın varsa hadi hemen yeni insanlarla tanışmaya başla, yoksa hemen aramıza katıl!",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .headlineSmall!
                  //       .copyWith(color: MyColors.ivory),
                  // ),
                  Column(
                    children: [
                      CustomElevatedButton(
                        child: const Text("Kayıt ol"),
                        onPressed: () {
                          router.push(const SignUpRoute());
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            router.push(const SignInRoute());
                          },
                          child: const Text("Zaten hesabım var")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
