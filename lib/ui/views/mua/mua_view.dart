import 'package:beautystar_user_app/helper/general_function.dart';
import 'package:beautystar_user_app/models/mua_category.dart';
import 'package:beautystar_user_app/ui/views/mua/mua_viewmodel.dart';
import 'package:beautystar_user_app/ui/widgets/items/mua_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class MuaView extends ViewModelBuilderWidget<MuaViewModel> {

  final MuaCategory category;

  MuaView({this.category});

  @override
  bool get reactive => super.reactive;

  @override
  MuaViewModel viewModelBuilder(BuildContext context) => MuaViewModel(
    category: category
  );

  @override
  void onViewModelReady(MuaViewModel model) => model.init();

  @override
  Widget builder(BuildContext context, MuaViewModel model, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cari Make Up Artist"),
          leading: backButton(context),
          bottom: appBarBorderBottom(),
        ),
        body: _buildListData(model)
      ),
    );
  }

  Widget _buildListData(MuaViewModel model) {
    return model.isBusy ? Center(child: NxLoadingSpinner()) : RefreshIndicator(
      onRefresh: () => model.refresh(),
      child: ListView(
        controller: model.scrollController,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: model?.mua?.length ?? 0,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) => MuaItem(mua: model.mua[index]),
          ),
          model.isLoadMore ? Center(child: Padding(
            padding: EdgeInsets.all(32),
            child: NxLoadingSpinner(),
          )) : Container()
        ],
      ),
    );
  }
}