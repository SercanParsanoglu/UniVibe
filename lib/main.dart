import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_social/core/theme/light_theme/light_theme.dart';
import 'package:uni_social/feature/router/app_router.dart';

Future<void> main() async {
  //Widget ağacının başlatılması için
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  //Sadece dikeyde çalışması için
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //ScreenUtilin düzgün entegre edilebilmesi için küçük bir bekletme
  await Future.delayed(const Duration(milliseconds: 150));
  runApp(EasyLocalization(
      supportedLocales: const [Locale('tr'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('tr'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      fontSizeResolver: FontSizeResolvers.height,
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
