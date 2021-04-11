// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/mua.dart';
import '../ui/views/forgot_password/forgot_password_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/home_layout/home_layout_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/profile/profile_view.dart';
import '../ui/views/profile/setting/edit_password/edit_password_view.dart';
import '../ui/views/profile/setting/edit_profile/edit_profile_view.dart';
import '../ui/views/register/register_view.dart';
import '../ui/views/splash/splash_view.dart';

class Routes {
  static const String splashView = '/splash-view';
  static const String registerView = '/register-view';
  static const String loginView = '/login-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String homeView = '/home-view';
  static const String homeLayoutView = '/home-layout-view';
  static const String profileView = '/profile-view';
  static const String editPasswordView = '/edit-password-view';
  static const String editProfileView = '/edit-profile-view';
  static const all = <String>{
    splashView,
    registerView,
    loginView,
    forgotPasswordView,
    homeView,
    homeLayoutView,
    profileView,
    editPasswordView,
    editProfileView,
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
    RouteDef(Routes.homeLayoutView, page: HomeLayoutView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.editPasswordView, page: EditPasswordView),
    RouteDef(Routes.editProfileView, page: EditProfileView),
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
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => HomeViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(
          weddingMua: args.weddingMua,
          weddingMuaUpdated: args.weddingMuaUpdated,
        ),
        settings: data,
      );
    },
    HomeLayoutView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeLayoutView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileView(),
        settings: data,
      );
    },
    EditPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditPasswordView(),
        settings: data,
      );
    },
    EditProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditProfileView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeView arguments holder class
class HomeViewArguments {
  final List<Mua> weddingMua;
  final void Function(List<Mua>) weddingMuaUpdated;
  HomeViewArguments({this.weddingMua, this.weddingMuaUpdated});
}
