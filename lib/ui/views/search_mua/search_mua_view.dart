import 'package:beautystar_user_app/helper/general_function.dart';
import 'package:beautystar_user_app/ui/views/search_mua/search_mua_viewmodel.dart';
import 'package:beautystar_user_app/ui/widgets/items/mua_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class SearchMuaView extends ViewModelBuilderWidget<SearchMuaViewModel> {

  @override
  bool get reactive => super.reactive;

  @override
  SearchMuaViewModel viewModelBuilder(BuildContext context) => SearchMuaViewModel();

  @override
  void onViewModelReady(SearchMuaViewModel model) => model.init();

  @override
  Widget builder(BuildContext context, SearchMuaViewModel model, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: NxTextFieldBox(
              textHint: "Cari ...",
              suffixIcon: Icons.search,
              suffixIconClicked: model.loadData,
              controller: TextEditingController()
                ..text = model.search
                ..selection = TextSelection.collapsed(offset: model.search.length),
              onChanged: model.searchChanged,
              onFieldSubmitted: (val) => model.loadData(),
            ),
            leading: backButton(context),
            bottom: appBarBorderBottom(),
          ),
          body: _buildListData(model)
        ),
      ),
    );
  }

  Widget _buildListData(SearchMuaViewModel model) {
    if(model.search == null || model.search == "") {
      return Center(
        child: NxText("Ketik nama MUA yang mau kamu cari", color: Colors.grey[700])
      );
    }
    if(model.isSearchFinished && model.mua.isEmpty) {
      return Center(
        child: NxText("Mua tidak ditemukan", color: Colors.grey[700])
      );
    }
    return model.isBusy ? Center(child: NxLoadingSpinner()) : ListView.separated(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: model?.mua?.length ?? 0,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => MuaBrandItem(mua: model.mua[index]),
    );
  }
}