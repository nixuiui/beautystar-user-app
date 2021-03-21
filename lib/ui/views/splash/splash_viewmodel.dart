import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  Future init() async {
    await Future.delayed(Duration(seconds: 2));
    navigateToHome();
  }

  navigateToHome() {
    _navigationService.clearStackAndShow(Routes.homeLayout);
  }

}