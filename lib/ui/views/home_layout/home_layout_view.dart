import 'package:beautystar_user_app/ui/views/home_layout/home_layout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeLayoutView extends ViewModelBuilderWidget<HomeLayoutViewModel> {
  
  @override
  bool get reactive => super.reactive;

  @override
  HomeLayoutViewModel viewModelBuilder(BuildContext context) => HomeLayoutViewModel();

  @override
  void onViewModelReady(HomeLayoutViewModel model) => model.init();
  
  @override
  Widget builder(BuildContext context, HomeLayoutViewModel model, Widget child) {
    return Scaffold(
      body: Center(
        child: model.currentTab(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: model.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: model.onItemTapped,
      )
    );
  }
}