import 'package:beautystar_user_app/api/mua_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:beautystar_user_app/models/mua_category.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_options.dart';
import 'package:stacked/stacked.dart';

class MuaViewModel extends BaseViewModel {

  MuaViewModel({this.category});

  final api = MuaApi();

  List<NxOptions<MuaCategory>> categories = locator<LocalDatabaseService>().getMuaCategories();
  MuaCategory category;

  var mua = <Mua>[];
  var page = 1,
      limit = 20,
      search = "",
      isLoadMore = false,
      hasReachedMax = false,

      scrollController = ScrollController(),
      scrollThreshold = 200.0;

  Future init() async {
    scrollController.addListener(_onScroll);
    refresh();
  }

  refresh() async {
    setBusy(true);
    page = 1;
    await loadData();
  }

  void _onScroll() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold && !hasReachedMax && !isLoadMore) {
      if(!isBusy) {
        isLoadMore = true;
        notifyListeners();
        loadData();
      }
    }
  }

  updatePage() {
    int length = mua.length;
    if(length%limit > 0) hasReachedMax = true;
    page = (mua.length/limit).ceil() + 1;
    notifyListeners();
  }

  loadData() async {
    try {
      final response = await api.loadMua(
        page: page, 
        limit: limit, 
        search: search,
      );
      if(!isLoadMore) mua = response;
      else mua.addAll(response);
      setBusy(false);
      isLoadMore = false;
      updatePage();
    } catch (error) {
      setBusy(false);
      isLoadMore = false;
      print(error);
    }
  }

}