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

  final List<Mua> mua;
  final ValueChanged<List<Mua>> dataUpdated;

  HomeView({this.mua, this.dataUpdated});

  @override
  bool get reactive => super.reactive;

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel(
    mua: mua
  );

  @override
  void onViewModelReady(HomeViewModel model) => model.init();

  double widthScreen;

  @override
  Widget builder(BuildContext context, HomeViewModel model, Widget child) {

    if(dataUpdated != null) {
      dataUpdated(model.mua);
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
            _buildWeddingMakeUp(model),
            _buildHairDo(),
          ],
        )
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
                NxText.subtitle("Wedding Make Up"),
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
            child: model.isBusy ? Center(child: NxLoadingSpinner()) : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: model.mua.length,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemBuilder: (context, index) => MuaItemSquare(size: widthScreen * 0.4)
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildHairDo() {
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
                NxText.subtitle("Wedding Make Up"),
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
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemBuilder: (context, index) => MuaItemSquare(size: widthScreen * 0.4)
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
          borderRadius: BorderRadius.circular(8),
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