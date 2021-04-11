import 'package:beautystar_user_app/api/general_api.dart';
import 'package:beautystar_user_app/api/mua_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:beautystar_user_app/models/home_category.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final muaApi = MuaApi();
  final generalApi = GeneralApi();

  var isLoadingHomeCategories = false;
  List<HomeCategory> homeCategories = [];

  var isLoadingweddingMua = false;
  List<Mua> weddingMua;
  
  var isLoadingGraduationMua = false;
  List<Mua> graduationMua;

  HomeViewModel({
    this.weddingMua, 
    this.homeCategories,
    this.graduationMua
  });

  Future init() async {
    if(homeCategories.isEmpty) {
      loadHomeCategories();
    }
    if(weddingMua.isEmpty) {
      loadDataWeddingMua();
    }
    if(graduationMua.isEmpty) {
      loadDataGraduationMua();
    }
  }
    
  loadHomeCategories() async {
    try {
      isLoadingHomeCategories = true;
      notifyListeners();
      homeCategories = await generalApi.loadHome();
      isLoadingHomeCategories = false;
      notifyListeners();
    } catch (error) {
      isLoadingHomeCategories = false;
      notifyListeners();
    }
  }

  navigateToHome() {
    _navigationService.clearStackAndShow(Routes.splashView);
  }

  refresh() {
    loadDataWeddingMua();
    loadDataGraduationMua();
  }

  loadDataWeddingMua() async {
    try {
      isLoadingweddingMua = true;
      notifyListeners();
      weddingMua = await muaApi.loadMua(page: 1, limit: 10, category: 24);
      isLoadingweddingMua = false;
      notifyListeners();
    } catch (error) {
      isLoadingweddingMua = false;
      notifyListeners();
    }
  }
  
  loadDataGraduationMua() async {
    try {
      isLoadingGraduationMua = true;
      notifyListeners();
      graduationMua = await muaApi.loadMua(page: 1, limit: 10, category: 3);
      isLoadingGraduationMua = false;
      notifyListeners();
    } catch (error) {
      isLoadingGraduationMua = false;
      notifyListeners();
    }
  }

}