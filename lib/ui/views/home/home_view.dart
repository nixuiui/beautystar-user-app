import 'package:beautystar_user_app/app/app_consts.dart';
import 'package:beautystar_user_app/models/home_category.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:beautystar_user_app/ui/views/home/home_viewmodel.dart';
import 'package:beautystar_user_app/ui/widgets/items/mua_item_square.dart';
import 'package:beautystar_user_app/ui/widgets/items/slider_item.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class HomeView extends ViewModelBuilderWidget<HomeViewModel> {

  final List<HomeCategory> homeCategories;
  final List<Mua> weddingMua;
  final List<Mua> graduationMua;
  final ValueChanged<List<HomeCategory>> homeCategoriesUpdated;
  final ValueChanged<List<Mua>> weddingMuaUpdated;
  final ValueChanged<List<Mua>> graduationMuaUpdated;

  HomeView({
    this.homeCategories, 
    this.weddingMua, 
    this.graduationMua, 
    this.homeCategoriesUpdated, 
    this.weddingMuaUpdated,
    this.graduationMuaUpdated,
  });

  @override
  bool get reactive => super.reactive;

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel(
    weddingMua: weddingMua,
    graduationMua: graduationMua,
    homeCategories: homeCategories
  );

  @override
  void onViewModelReady(HomeViewModel model) => model.init();

  double widthScreen;

  @override
  Widget builder(BuildContext context, HomeViewModel model, Widget child) {

    if(homeCategoriesUpdated != null) {
      homeCategoriesUpdated(model.homeCategories);
    }
    
    if(weddingMuaUpdated != null) {
      weddingMuaUpdated(model.weddingMua);
    }
    
    if(graduationMuaUpdated != null) {
      graduationMuaUpdated(model.graduationMua);
    }

    widthScreen = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/logo_text.png", height: 20,)
        ),
        body: ListView(
          children: [
            _buildSlider(model, context),
            _buildCategory(model),
            _buildWeddingMakeUp(model),
            _buildGraduation(model),
          ],
        )
      ),
    );
  }

  Widget _buildCategory(HomeViewModel model) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NxText.subtitle("Kategori Layanan"),
                  SizedBox(height: 4),
                  NxText.small(
                    "Cari service yang Anda inginkan",
                    color: Colors.grey,
                  ),
                ],
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => model.navigateToMua(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NxText.bold("Cari Mua", color: AppConst.accent),
                        Icon(Icons.chevron_right_rounded, color: AppConst.accent, size: 18)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          model.isLoadingHomeCategories ? Center(child: NxLoadingSpinner()) : GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1/1,
            physics: ClampingScrollPhysics(),
            children: List.generate(model.homeCategories.length, (index) => NxBox(
              width: (widthScreen * 0.4),
              borderRadius: 8,
              image: NetworkImage(model.homeCategories[index]?.image ?? ""),
              child: NxBox(
                borderRadius: 8,
                color: Colors.black87.withOpacity(0.2),
                padding: 8,
                child: Center(
                  child: NxText(
                    model.homeCategories[index]?.muaService?.name,
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  )
                )
              ),
            ))
          ),
        ],
      ),
    );
  }

  Widget _buildWeddingMakeUp(HomeViewModel model) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NxText.subtitle("Akad & Resepsi ${model.isLoadingweddingMua}"),
                SizedBox(height: 4),
                NxText.small(
                  "Jadikan penampilan Anda yang terbaik di hari yang spesial",
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: (widthScreen * 0.4),
            child: model.isLoadingweddingMua ? Center(child: NxLoadingSpinner()) : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: model.weddingMua.length,
              separatorBuilder: (context, index) => SizedBox(width: 16),
              itemBuilder: (context, index) => MuaItemSquare(
                width: widthScreen * 0.8,
                height: widthScreen * 0.4,
                mua: model.weddingMua[index],
              )
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGraduation(HomeViewModel model) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NxText.subtitle("Graduation/Yudisium"),
                SizedBox(height: 4),
                NxText.small(
                  "Jadikan penampilan yang terbaik di momen kelulusan",
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: (widthScreen * 0.4),
            child: model.isLoadingGraduationMua ? Center(child: NxLoadingSpinner()) : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: model.graduationMua.length,
              separatorBuilder: (context, index) => SizedBox(width: 16),
              itemBuilder: (context, index) => MuaItemSquare(
                width: widthScreen * 0.8,
                height: widthScreen * 0.4,
                mua: model.graduationMua[index],
              )
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(HomeViewModel model, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 32, left: 16, right: 16, top: 16),
      child: NxBox(
        borderRadius: 8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 5/3,
            child: Carousel(
              showIndicator: false,
              images: List.generate(4, (index) => SliderItem(aspectRatio: 5/3))
            )
          )
        ),
      ),
    );
  }
}