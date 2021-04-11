import 'package:beautystar_user_app/api/account_api.dart';
import 'package:beautystar_user_app/api/general_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:beautystar_user_app/models/home_category.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:beautystar_user_app/ui/views/home/home_view.dart';
import 'package:beautystar_user_app/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeLayoutViewModel extends BaseViewModel {

  final _localDatabaseService = locator<LocalDatabaseService>();
  final _navigationService = locator<NavigationService>();
  final generalApi = GeneralApi();
  var isLoggedIn = locator<LocalDatabaseService>().isLoggedIn();
  static TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  int selectedIndex = 0;
  List<Widget> tabs = [];

  final accountApi = AccountApi();

  // HOME TAB
  List<HomeCategory> homeCategories = [];
  List<Mua> weddingMua = [];
  List<Mua> graduationMua = [];

  Future init() async {
    fetchAccountData();
    fetchLibraries();
    updateTabs();
  }

  fetchAccountData() async {
    if(isLoggedIn) {
      try {
        final account = await accountApi.me();
        _localDatabaseService.saveAccountToBox(account);
      } catch (error) {}
    }
  }

  fetchLibraries() async {
    final response = await generalApi.loadLibraries();
    _localDatabaseService.saveLibrariesToBox(response);
  }

  void onItemTapped(int index) {
    if(index == 2 && !isLoggedIn) {
      _navigationService.navigateTo(Routes.loginView);
    } else {
      selectedIndex = index;
      updateTabs();
    }
  }

  updateTabs() {
    tabs = <Widget>[
      HomeView(
        homeCategories: homeCategories,
        weddingMua: weddingMua,
        graduationMua: graduationMua,
        homeCategoriesUpdated: (data) => homeCategories = data,
        weddingMuaUpdated: (data) => weddingMua = data,
        graduationMuaUpdated: (data) => graduationMua = data,
      ),
      Text("Text", style: optionStyle),
      ProfileView()
    ];
    notifyListeners();
  }

  Widget currentTab() {
    return tabs.elementAt(selectedIndex);
  }

}