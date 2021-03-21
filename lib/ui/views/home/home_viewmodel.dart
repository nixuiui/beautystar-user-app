import 'package:beautystar_user_app/api/general_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final _localDatabaseService = locator<LocalDatabaseService>();
  final generalApi = GeneralApi();

  Future init() async {
    fetchLibraries();
  }

  navigateToHome() {
    _navigationService.clearStackAndShow(Routes.splashView);
  }

  fetchLibraries() async {
    final response = await generalApi.loadLibraries();
    print("response: ${response[0].categoryId}");
    _localDatabaseService.saveLibrariesToBox(response);
  }

}