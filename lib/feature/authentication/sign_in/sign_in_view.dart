import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/constants/colors.dart';
import 'package:uni_social/core/extension/theme_extension.dart';
import 'package:uni_social/core/widgets/custom_elevated_button.dart';
import 'package:uni_social/core/widgets/inputs/input_base.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final screenHeight = ScreenUtil().screenHeight -
      ScreenUtil().statusBarHeight -
      AppBar().preferredSize.height;
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
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: screenHeight),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/canva2.png",
                  width: ScreenUtil().screenWidth,
                  height: Theme.of(context).cleanHeightWithAppbar,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 500.h,
                      decoration: BoxDecoration(
                        color: Colors.white, // Arka plan rengi
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft:
                                Radius.circular(20)), // Kenarları yuvarlatma
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
                          InputBase(
                              textFFType: InputType.email,
                              textEditingController: usernameController),
                          const SizedBox(
                            height: 10,
                          ),
                          InputBase(
                              textFFType: InputType.password,
                              textEditingController: passwordController),
                          const SizedBox(
                            height: 90,
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
