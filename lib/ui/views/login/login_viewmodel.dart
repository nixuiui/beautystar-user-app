import 'package:beautystar_user_app/api/account_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:beautystar_user_app/ui/custom_dialogs/base_custom_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final _localDatabaseService = locator<LocalDatabaseService>();
  final _dialogService = locator<DialogService>();
  final api = AccountApi();

  String username = '';
  String password = '';
  
  String errorUsername;
  String errorPassword;

  Future init() async {}

  navigateToHome() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }
  
  navigateToRegister() {
    _navigationService.navigateTo(Routes.registerView);
  }
  
  navigateToForgotPassword() {
    _navigationService.navigateTo(Routes.forgotPasswordView);
  }

  Future login() async {
    resetErrorText();
    if(username.isNotEmpty && password.isNotEmpty) {
      try {
        setBusy(true);
        notifyListeners();
        final response = await api.login(username: username, password: password);
        _localDatabaseService.saveAccountToBox(response);
        _localDatabaseService.saveApiTokenToBox(response.token);
        _navigationService.back();
        _navigationService.clearStackAndShow(Routes.homeLayoutView);
        setBusy(false);
        notifyListeners();
      } catch (error) {
        _dialogService.showCustomDialog(
          variant: DialogType.error,
          title: 'Failed',
          description: error.toString(),
          mainButtonTitle: 'OK',
        );
        setBusy(false);
        notifyListeners();
      }
    } else {
      setErrorText();
    }
  }

  resetErrorText() {
    errorUsername = '';
    errorPassword = '';
    notifyListeners();
  }
  
  setErrorText() {
    if(username == null || username == '')
      errorUsername = 'Username harus diisi';
    if(password == null || password == '')
      errorPassword = 'Password harus diisi';
    notifyListeners();
  }

}