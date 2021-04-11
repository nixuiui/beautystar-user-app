import 'package:beautystar_user_app/api/mua_api.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:stacked/stacked.dart';

class SearchMuaViewModel extends BaseViewModel {

  final api = MuaApi();

  var mua = <Mua>[];
  var search = "";
  var isSearchFinished = false;

  Future init() async {}

  refresh() async {
    setBusy(true);
    await loadData();
  }

  searchChanged(String val) {
    search = val;
    isSearchFinished = false;
    if(search == "") {
      mua = [];
    }
    notifyListeners();
  }

  loadData() async {
    try {
      setBusy(true);
      notifyListeners();
      mua = await api.loadMua(
        page: 1, 
        limit: 20, 
        search: search,
      );
      setBusy(false);
      isSearchFinished = true;
      notifyListeners();
    } catch (error) {
      setBusy(false);
      isSearchFinished = true;
      notifyListeners();
    }
  }

}