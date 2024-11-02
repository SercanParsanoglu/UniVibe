// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:uni_social/feature/authentication/auth/auth_view.dart' as _i1;
import 'package:uni_social/feature/authentication/sign_in/sign_in_view.dart'
    as _i3;
import 'package:uni_social/feature/authentication/sign_up/sign_up_view.dart'
    as _i4;
import 'package:uni_social/feature/onboard/onboard_view.dart' as _i2;

/// generated route for
/// [_i1.AuthView]
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthView();
    },
  );
}

/// generated route for
/// [_i2.OnboardView]
class OnboardRoute extends _i5.PageRouteInfo<void> {
  const OnboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnboardView();
    },
  );
}

/// generated route for
/// [_i3.SignInView]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignInView();
    },
  );
}

/// generated route for
/// [_i4.SignUpView]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignUpView();
    },
  );
}
