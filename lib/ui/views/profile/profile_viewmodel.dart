import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final _localDatabaseService = locator<LocalDatabaseService>();
  
  var account = locator<LocalDatabaseService>().getAccount();

  Future init() async {}

  navigateToEditPassword() {
    _navigationService.navigateTo(Routes.editPasswordView);
  }

  navigateToEditProfile() {
    _navigationService.navigateTo(Routes.editProfileView);
  }

  logout() {
    _localDatabaseService.logout();
    _navigationService.clearStackAndShow(Routes.homeLayout);
  }

}