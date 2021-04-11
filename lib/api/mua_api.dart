import 'dart:convert';

import 'package:beautystar_user_app/api/main_api.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:beautystar_user_app/models/mua_category.dart';

class MuaApi extends MainApi {

  Future<List<Mua>> loadMua({
    int page = 1, 
    int limit = 20,
    String search = "",
    int category,
  }) async {
    try {
      final response = await sendRequest(
        url: "$host/public/mua?page=$page&limit=$limit&search=$search&category=${category ?? ''}",
        requestMethod: RequestMethod.GET
      );
      return muasFromJson(jsonEncode(jsonDecode(response)['rows']));
    } catch (error) {
      throw error;
    }
  }
  
  Future<Mua> loadMuaDetail({String id}) async {
    try {
      final response = await sendRequest(
        url: "$host/public/mua/$id",
        requestMethod: RequestMethod.GET
      );
      return muaFromJson(response);
    } catch (error) {
      throw error;
    }
  }
  
  Future<List<MuaCategory>> loadCategories() async {
    try {
      final response = await sendRequest(
        url: "$host/public/mua-categories",
        requestMethod: RequestMethod.GET
      );
      return muaCategoriesFromJson(response);
    } catch (error) {
      throw error;
    }
  }

}