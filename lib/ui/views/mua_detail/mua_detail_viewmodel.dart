import 'package:beautystar_user_app/api/mua_api.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:stacked/stacked.dart';

class MuaDetailViewModel extends BaseViewModel {
  final api = MuaApi();

  MuaDetailViewModel({this.id, this.mua});

  final String id;
  Mua mua;
  var maxShowPhoto = 9;

  Future init() async {
    if(id != null && id != "") {
      loadData(id);
    }
    resetMaxPhoto();
  }

  refresh() async {
    await loadData(mua.id.toString());
  }

  loadData(String id) async {
    try {
      setBusy(true);
      notifyListeners();
      mua = await api.loadMuaDetail(id: id);
      setBusy(false);
      notifyListeners();
    } catch (error) {
      setBusy(false);
      notifyListeners();
    }
  }

  resetMaxPhoto() {
    maxShowPhoto = (mua?.portofolios?.length ?? 0) > 9 ? 9 : (mua?.portofolios?.length ?? 0);
    notifyListeners();
  }

  loadMorePortfolio() {
    maxShowPhoto += 9;
    if(maxShowPhoto > (mua?.portofolios?.length ?? 0)) {
      maxShowPhoto = mua?.portofolios?.length ?? 0;
    }
    notifyListeners();
  }

}