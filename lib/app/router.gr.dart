// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/home_category.dart';
import '../models/mua.dart';
import '../models/mua_category.dart';
import '../ui/views/forgot_password/forgot_password_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/home_layout/home_layout_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/mua/mua_view.dart';
import '../ui/views/mua_detail/mua_detail_view.dart';
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
  static const String muaView = '/mua-view';
  static const String muaDetailView = '/mua-detail-view';
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
    muaView,
    muaDetailView,
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
    RouteDef(Routes.muaView, page: MuaView),
    RouteDef(Routes.muaDetailView, page: MuaDetailView),
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
          homeCategories: args.homeCategories,
          weddingMua: args.weddingMua,
          graduationMua: args.graduationMua,
          homeCategoriesUpdated: args.homeCategoriesUpdated,
          weddingMuaUpdated: args.weddingMuaUpdated,
          graduationMuaUpdated: args.graduationMuaUpdated,
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
    MuaView: (data) {
      final args = data.getArgs<MuaViewArguments>(
        orElse: () => MuaViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MuaView(category: args.category),
        settings: data,
      );
    },
    MuaDetailView: (data) {
      final args = data.getArgs<MuaDetailViewArguments>(
        orElse: () => MuaDetailViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MuaDetailView(
          id: args.id,
          mua: args.mua,
        ),
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
  final List<HomeCategory> homeCategories;
  final List<Mua> weddingMua;
  final List<Mua> graduationMua;
  final void Function(List<HomeCategory>) homeCategoriesUpdated;
  final void Function(List<Mua>) weddingMuaUpdated;
  final void Function(List<Mua>) graduationMuaUpdated;
  HomeViewArguments(
      {this.homeCategories,
      this.weddingMua,
      this.graduationMua,
      this.homeCategoriesUpdated,
      this.weddingMuaUpdated,
      this.graduationMuaUpdated});
}

/// MuaView arguments holder class
class MuaViewArguments {
  final MuaCategory category;
  MuaViewArguments({this.category});
}

/// MuaDetailView arguments holder class
class MuaDetailViewArguments {
  final String id;
  final Mua mua;
  MuaDetailViewArguments({this.id, this.mua});
}
