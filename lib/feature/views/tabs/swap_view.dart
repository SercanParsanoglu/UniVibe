import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:uni_social/core/constants/colors.dart';
import 'package:uni_social/core/widgets/buttons/custom_elevated_button.dart';
import 'package:uni_social/core/widgets/space/space.dart';
import 'package:uni_social/feature/constants/assets.dart';
import 'package:uni_social/feature/model/swap_model.dart';

List<SwapModel> listSwapModel = [
  SwapModel(
    desc: 'Aslı Turan, Yıldız Teknik Üni, Edebiyat Fakültesi, 21',
    photo: CustomAssets.person1,
  ),
  SwapModel(
    desc: 'Deniz Bakaç, Yıldız Teknik Üni, Fen Fakültesi, 22',
    photo: CustomAssets.person2,
  ),
  SwapModel(
    desc: 'Akif Bakar, Yıldız Teknik Üni, Mühendislik Fakültesi, 18',
    photo: CustomAssets.person3,
  ),
  SwapModel(
    desc: 'Ahmet Yılmaz, Yıldız Teknik Üni, Teknoloji Fakültesi, 21',
    photo: CustomAssets.person4,
  ),
];

@RoutePage()
class SwapView extends StatefulWidget {
  const SwapView({super.key});

  @override
  State<SwapView> createState() => _SwapViewState();
}

class _SwapViewState extends State<SwapView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.forward),
        onPressed: () {
          setState(() {
            index += 1;
            print(index);
          });
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: SwapCard(
                    swapModel: listSwapModel[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwapCard extends StatelessWidget {
  SwapCard({required this.swapModel, super.key});
  SwapModel swapModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.teal3,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      width: 300,
      height: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r), // Kenarları yuvarlat
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 340,
              child: Image.asset(
                swapModel.photo,
                fit: BoxFit.cover,
              ),
            ),
            Space(),
            SizedBox(
              width: 280,
              child: Text(
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.white, fontSize: 14),
                maxLines: 5,
                swapModel.desc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
