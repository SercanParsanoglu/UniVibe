// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:uni_social/feature/views/authentication/auth/auth_view.dart'
    as _i1;
import 'package:uni_social/feature/views/authentication/sign_in/sign_in_view.dart'
    as _i3;
import 'package:uni_social/feature/views/authentication/sign_up/sign_up_user_detail_view.dart'
    as _i4;
import 'package:uni_social/feature/views/authentication/sign_up/sign_up_view.dart'
    as _i5;
import 'package:uni_social/feature/views/authentication/uni/uni_view.dart'
    as _i6;
import 'package:uni_social/feature/views/onboard/onboard_view.dart' as _i2;

/// generated route for
/// [_i1.AuthView]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthView();
    },
  );
}

/// generated route for
/// [_i2.OnboardView]
class OnboardRoute extends _i7.PageRouteInfo<void> {
  const OnboardRoute({List<_i7.PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnboardView();
    },
  );
}

/// generated route for
/// [_i3.SignInView]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignInView();
    },
  );
}

/// generated route for
/// [_i4.SignUpUserDetailView]
class SignUpUserDetailRoute extends _i7.PageRouteInfo<void> {
  const SignUpUserDetailRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpUserDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpUserDetailRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignUpUserDetailView();
    },
  );
}

/// generated route for
/// [_i5.SignUpView]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignUpView();
    },
  );
}

/// generated route for
/// [_i6.UniView]
class UniRoute extends _i7.PageRouteInfo<void> {
  const UniRoute({List<_i7.PageRouteInfo>? children})
      : super(
          UniRoute.name,
          initialChildren: children,
        );

  static const String name = 'UniRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.UniView();
    },
  );
}
