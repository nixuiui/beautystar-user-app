import 'package:beautystar_user_app/helper/general_function.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:beautystar_user_app/ui/views/mua_detail/mua_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indonesia/indonesia.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class MuaDetailView extends ViewModelBuilderWidget<MuaDetailViewModel> {

  final String id;
  final Mua mua;

  MuaDetailView({this.id, this.mua});

  @override
  bool get reactive => super.reactive;

  @override
  MuaDetailViewModel viewModelBuilder(BuildContext context) => MuaDetailViewModel(
    id: id,
    mua: mua
  );

  @override
  void onViewModelReady(MuaDetailViewModel model) => model.init();

  double widthScreen;

  @override
  Widget builder(BuildContext context, MuaDetailViewModel model, Widget child) {

    widthScreen = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(mua?.brandName ?? "Mua"),
          leading: backButton(context),
          bottom: appBarBorderBottom(),
        ),
        body: ListView(
          children: [
            _buildHeader(model),
            Divider(height: 0),
            _buildPortfolio(model),
            _buildPriceList(model),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolio(MuaDetailViewModel model) {
    return (mua?.portofolios?.length ?? 0) <= 0 ? Container() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NxText.subtitle("Portfolio", color: Colors.black87),
        ),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1/1,
          physics: ClampingScrollPhysics(),
          children: List.generate(model.maxShowPhoto, (index) => NxBox(
            width: (widthScreen * 0.4),
            borderRadius: 8,
            color: Colors.grey[100],
            image: NetworkImage(model.mua.portofolios[index]?.photo ?? ""),
          ))
        ),
        model.maxShowPhoto >= model.mua.portofolios.length ? Container() : Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NxButton(
            text: "Lebih Banyak",
            color: Colors.grey[200],
            textColor: Colors.black87,
            fontSize: 14,
            icon: Icons.keyboard_arrow_down,
            onPressed: model.loadMorePortfolio,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceList(MuaDetailViewModel model) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              NxText.subtitle("Layanan", color: Colors.black87),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    NxText("Kategori", fontSize: 10, color: Colors.grey[500]),
                    NxText("Semua Kategori", fontSize: 12),
                  ],
                ),
              ),
              Icon(Icons.keyboard_arrow_down, size: 14)
            ],
          ),
          SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: mua?.services?.length ?? 0,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) => NxBox(
              padding: 16,
              borderRadius: 8,
              borderColor: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NxText.bold(mua?.services[index]?.name ?? "-", color: Colors.black87),
                  SizedBox(height: 4),
                  NxText.bold(
                    rupiah(mua?.services[index]?.price ?? "-"), 
                    color: Colors.green[700],
                  ),
                  SizedBox(height: 4),
                  NxText.formLabel(
                    rupiah(mua?.services[index]?.price ?? "-")
                  ),
                  SizedBox(height: 8),
                  NxText(
                    mua?.services[index]?.description ?? "-", 
                    color: Colors.grey[700],
                    fontSize: 14,
                    maxLines: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(MuaDetailViewModel model) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NxImage.avatar(
                image: NetworkImage(model?.mua?.user?.profilePhoto ?? ""),
                size: 60,
                borderColor: Colors.grey[300],
                borderSize: 1,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        NxText.small("Layanan"),
                        SizedBox(height: 8),
                        NxText.subtitle(model?.mua?.services?.length?.toString() ?? "0"),
                      ],
                    ),
                    Column(
                      children: [
                        NxText.small("Pesanan"),
                        SizedBox(height: 8),
                        NxText.subtitle(model?.mua?.services?.length?.toString() ?? "0"),
                      ],
                    ),
                    Column(
                      children: [
                        NxText.small("Rating"),
                        SizedBox(height: 8),
                        NxText.subtitle(model?.mua?.rate?.toString() ?? "-"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          NxText.subtitle(model?.mua?.brandName),
          SizedBox(height: 4),
          NxText(model?.mua?.description),
          SizedBox(height: 4),
          NxText.small((model?.mua?.city?.name?.toUpperCase() ?? "") + ", " + model?.mua?.province?.name?.toUpperCase(), color: Colors.grey),
        ],
      ),
    );
  }
}