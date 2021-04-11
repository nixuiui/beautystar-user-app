import 'package:beautystar_user_app/api/mua_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final muaApi = MuaApi();

  List<Mua> mua;
  var page = 1,
      limit = 20,
      search = "";

  HomeViewModel({this.mua});

  Future init() async {
    if(mua.isEmpty) {
      refresh();
    }
  }

  navigateToHome() {
    _navigationService.clearStackAndShow(Routes.splashView);
  }

  refresh() {
    setBusy(true);
    loadData();
  }

  loadData() async {
    try {
      mua = await muaApi.loadMua(
        page: page, 
        limit: limit, 
        search: search
      );
      setBusy(false);
    } catch (error) {
      setBusy(false);
      print(error);
    }
  }

}