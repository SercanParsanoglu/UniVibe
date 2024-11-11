import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uni_social/feature/router/app_router.gr.dart';
import 'package:uni_social/feature/views/authentication/sign_up/sign_up_user_detail_view.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom(
      barrierColor: Colors.amber, durationInMilliseconds: 100);
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardRoute.page, initial: true),
        AutoRoute(
          page: AuthRoute.page,
        ),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: UniRoute.page),
        AutoRoute(page: SignUpUserDetailRoute.page)
      ];
}

final router = AppRouter();
