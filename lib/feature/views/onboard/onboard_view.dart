import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:uni_social/core/constants/assets.dart';
import 'package:uni_social/core/widgets/custom_elevated_button.dart';
import 'package:uni_social/feature/views/onboard/onboard_model.dart';
import 'package:uni_social/feature/router/app_router.dart';
import 'package:uni_social/feature/router/app_router.gr.dart';
import 'package:uni_social/core/constants/colors.dart';
import 'package:uni_social/core/widgets/buttons/custom_elevated_button.dart';

@RoutePage()
class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  List<Widget> onboardViews = [
    const OnboardFirstView(),
    const OnBoardSecondView(),
    const OnBoardThirdView(),
  ];
  PageController _pageController = PageController();
  int _currentPageValue = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardViews.length,
                onPageChanged: (value) {
                  _currentPageValue = value;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return onboardViews[index];
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                onboardViews.length,
                (index) => _OnBoardCircle(
                  currentPageValue: _currentPageValue,
                  activeCircle: _currentPageValue == index,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomElevatedButton(
                child: Text(
                  _currentPageValue != 2 ? 'Devam et' : 'Hadi başlayalım',
                  style: const TextStyle(
                    color: WidgetColors.elevatedButtonTextColor,
                  ),
                ),
                onPressed: () async {
                  // await locator.get<CacheUserProvider>().writeHive(
                  //     UserModel(mail: "qasd@asd.asd", name: "Sercan"));
                  // // print(locator.get<CacheUserProvider>().userDetailData?.name ??
                  // //     "boş");
                  if (_currentPageValue != 2) {
                    _currentPageValue += 1;
                    _pageController.animateToPage(
                      _currentPageValue,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  } else {
                    router.push(const AuthRoute());
                  }
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class _OnBoardCircle extends StatelessWidget {
  _OnBoardCircle({
    required int currentPageValue,
    this.activeCircle = false,
    super.key,
  });
  bool activeCircle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: activeCircle ? MyColors.teal2 : MyColors.warmGrey2,
        ),
        width: 20,
        height: 20,
      ),
    );
  }
}

class OnboardFirstView extends StatelessWidget {
  const OnboardFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardContainer(
      onBoardModel: OnBoardModel(
        description:
            "Üniversitedeki öğrencilerle tanış ve ortak ilgi alanlarına sahip yeni arkadaşlar edin. Campus'teki sosyalleşme fırsatlarını kaçırma!",
        image: 'assets/images/onboard_image_1.json',
        headline: 'Yeni Arkadaşlıklar Seni Bekliyor!',
      ),
    );
  }
}

class OnBoardContainer extends StatelessWidget {
  OnBoardContainer({
    required this.onBoardModel,
    super.key,
  });
  OnBoardModel onBoardModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: LottieBuilder.asset(
                onBoardModel.image,
                height: 300,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 70,
                  child: Text(
                    onBoardModel.headline,
                    style: const TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  child: Text(
                    onBoardModel.description,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardSecondView extends StatelessWidget {
  const OnBoardSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardContainer(
      onBoardModel: OnBoardModel(
        description:
            'İlgini çeken etkinliklere katıl veya kendi etkinliğini oluşturarak ortak zevklere sahip insanlarla sosyalleş!',
        image: 'assets/images/onboard_image_2.json',
        headline: 'İlgi Alanlarına Göre Eşleş!',
      ),
    );
  }
}

class OnBoardThirdView extends StatelessWidget {
  const OnBoardThirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardContainer(
      onBoardModel: OnBoardModel(
        description:
            'Kendine güvenli bir ortamda, yalnızca üniversite e-postası ile doğrulanmış kullanıcılarla tanış. Yeni arkadaşlıklar için ilk adımı at!',
        image: 'assets/images/onboard_image_3.json',
        headline: 'Güvenli ve Eğlenceli Bir Deneyim!',
      ),
    );
  }
}
