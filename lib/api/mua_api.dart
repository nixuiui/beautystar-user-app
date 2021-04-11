import 'dart:convert';

import 'package:beautystar_user_app/api/main_api.dart';
import 'package:beautystar_user_app/models/mua.dart';

class MuaApi extends MainApi {

  Future<List<Mua>> loadMua({
    int page = 1, 
    int limit = 20,
    String search = "",
  }) async {
    try {
      final response = await sendRequest(
        url: "$host/public/mua?page=$page&limit=$limit&search=$search",
        requestMethod: RequestMethod.GET
      );
      return muaFromJson(jsonEncode(jsonDecode(response)['rows']));
    } catch (error) {
      throw error;
    }
  }

}