import 'package:beautystar_user_app/ui/views/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class SplashView extends ViewModelBuilderWidget<SplashViewModel> {

  @override
  bool get reactive => super.reactive;

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();

  @override
  void onViewModelReady(SplashViewModel model) => model.init();

  @override
  Widget builder(BuildContext context, SplashViewModel model, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Center(child: Image.asset("assets/logo.png", height: 100)),
      ),
    );
  }
}