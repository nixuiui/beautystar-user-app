import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  Future init() async {}

  navigateToHome() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }
  
  navigateToRegister() {
    _navigationService.navigateTo(Routes.registerView);
  }

}