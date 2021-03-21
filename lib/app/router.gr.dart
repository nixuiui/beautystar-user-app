// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/forgot_password/forgot_password_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/home_layout/home_layout.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/register/register_view.dart';
import '../ui/views/splash/splash_view.dart';

class Routes {
  static const String splashView = '/splash-view';
  static const String registerView = '/register-view';
  static const String loginView = '/login-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String homeView = '/home-view';
  static const String homeLayout = '/home-layout';
  static const all = <String>{
    splashView,
    registerView,
    loginView,
    forgotPasswordView,
    homeView,
    homeLayout,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.homeLayout, page: HomeLayout),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotPasswordView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    HomeLayout: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeLayout(),
        settings: data,
      );
    },
  };
}
