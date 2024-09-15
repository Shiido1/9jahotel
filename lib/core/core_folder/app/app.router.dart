// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:ninejahotel/ui/screens/dashboard.dart' as _i2;
import 'package:ninejahotel/ui/screens/first_screen.dart' as _i3;
import 'package:ninejahotel/ui/screens/forgot_password/first_forgot_password_screen.dart'
    as _i5;
import 'package:ninejahotel/ui/screens/login_screen.dart' as _i4;
import 'package:ninejahotel/ui/screens/reset_password.dart' as _i6;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const dashboard = '/';

  static const firstScreen = '/first-screen';

  static const loginScreen = '/login-screen';

  static const firstForgotPasswordScreen = '/first-forgot-password-screen';

  static const resetPassword = '/reset-password';

  static const all = <String>{
    dashboard,
    firstScreen,
    loginScreen,
    firstForgotPasswordScreen,
    resetPassword,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.dashboard,
      page: _i2.Dashboard,
    ),
    _i1.RouteDef(
      Routes.firstScreen,
      page: _i3.FirstScreen,
    ),
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i4.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.firstForgotPasswordScreen,
      page: _i5.FirstForgotPasswordScreen,
    ),
    _i1.RouteDef(
      Routes.resetPassword,
      page: _i6.ResetPassword,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Dashboard: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Dashboard(),
        settings: data,
      );
    },
    _i3.FirstScreen: (data) {
      final args = data.getArgs<FirstScreenArguments>(
        orElse: () => const FirstScreenArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.FirstScreen(key: args.key),
        settings: data,
      );
    },
    _i4.LoginScreen: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginScreen(),
        settings: data,
      );
    },
    _i5.FirstForgotPasswordScreen: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.FirstForgotPasswordScreen(),
        settings: data,
      );
    },
    _i6.ResetPassword: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ResetPassword(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class FirstScreenArguments {
  const FirstScreenArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant FirstScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFirstScreen({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.firstScreen,
        arguments: FirstScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFirstForgotPasswordScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.firstForgotPasswordScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetPassword([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resetPassword,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFirstScreen({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.firstScreen,
        arguments: FirstScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFirstForgotPasswordScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.firstForgotPasswordScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResetPassword([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resetPassword,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
