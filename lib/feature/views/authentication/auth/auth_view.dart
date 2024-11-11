import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uni_social/core/widgets/custom_elevated_button.dart';
import 'package:uni_social/core/widgets/modal_bottom_sheet/functions/show_sheet_functions.dart';
import 'package:uni_social/core/widgets/modal_bottom_sheet/view_modal_bottom_sheet.dart';
import 'package:uni_social/feature/constants/assets.dart';
import 'package:uni_social/feature/views/authentication/sign_in/sign_in_view.dart';
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
            CustomAssets.onboardBackground  ,
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
                            showSheetView(
                                context,
                                ViewModalBottomSheet(
                                    childPage: const SignInView()));
                            // showModalBottomSheet(
                            //   isScrollControlled: true,
                            //   backgroundColor: Colors.black.withOpacity(0),
                            //   context: context,
                            //   builder: (context) {
                            //     DraggableScrollableController
                            //         draggableScrollableController =
                            //         DraggableScrollableController();

                            //     return DraggableScrollableSheet(
                            //         expand: true,
                            //         // initialChildSize: 0.7,
                            //         // maxChildSize: 0.8,
                            //         // minChildSize: 0.3,
                            //         builder: (context, scrollController) =>
                            //             const SignInView());
                            //   },
                            // );
                            // // router.push(const SignInRoute());
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
