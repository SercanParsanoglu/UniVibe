import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uni_social/feature/model/uni_model.dart';
import 'package:uni_social/feature/views/authentication/uni/widgets/uni_card.dart';

@RoutePage()
class UniView extends StatelessWidget {
  const UniView({super.key});

  @override
  Widget build(BuildContext context) {
    final uniList = [
      UniModel(UniLogoPath: 'marmara_uni', UniName: 'Marmara Üniversitesi'),
      UniModel(UniLogoPath: 'arel_uni', UniName: 'Arel Üniversitesi'),
      UniModel(UniLogoPath: 'beykent_uni', UniName: 'Beykent Üniversitesi'),
      UniModel(
        UniLogoPath: 'bahcesehir_uni',
        UniName: 'Bahçeşehir Üniversitesi',
      ),
      UniModel(UniLogoPath: 'istanbul_uni', UniName: 'İstanbul Üniversitesi'),
      UniModel(UniLogoPath: 'koc_uni', UniName: 'Koç Üniversitesi'),
      UniModel(UniLogoPath: 'marmara_uni', UniName: 'Marmara Üniversitesi'),
      UniModel(UniLogoPath: 'arel_uni', UniName: 'Arel Üniversitesi'),
      UniModel(UniLogoPath: 'aydın_uni', UniName: 'Aydın Üniversitesi'),
      UniModel(UniLogoPath: 'marmara_uni', UniName: 'Marmara Üniversitesi'),
      UniModel(UniLogoPath: 'arel_uni', UniName: 'Arel Üniversitesi'),
      UniModel(UniLogoPath: 'beykent_uni', UniName: 'Beykent Üniversitesi'),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Her satırda 2 kart olacak
          crossAxisSpacing: 8, // Kartlar arasındaki yatay boşluk
          mainAxisSpacing: 8, // Kartlar arasındaki dikey boşluk
        ),
        itemBuilder: (context, index) => UniCard(uni: uniList[index]),
        itemCount: uniList.length,
      ),
    );
  }
}
