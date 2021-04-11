import 'package:beautystar_user_app/api/main_api.dart';
import 'package:beautystar_user_app/models/city.dart';
import 'package:beautystar_user_app/models/library_model.dart';
import 'package:beautystar_user_app/models/province.dart';

class GeneralApi extends MainApi {

  Future<List<LibraryModel>> loadLibraries() async {
    try {
      final response = await sendRequest(
        url: "$host/public/libraries",
        requestMethod: RequestMethod.GET
      );
      return libraryModelFromJson(response);
    } catch (error) {
      throw error;
    }
  }

  Future<List<Province>> provinces() async {
    try {
      final response = await sendRequest(
        url: "$host/public/provinces",
        requestMethod: RequestMethod.GET
      );
      return provinceFromJson(response);
    } catch (error) {
      throw error;
    }
  }
  
  Future<List<City>> cityByProvinceId({String provinceId}) async {
    try {
      final response = await sendRequest(
        url: "$host/public/cities/11/$provinceId",
        requestMethod: RequestMethod.GET
      );
      return citiesFromJson(response);
    } catch (error) {
      throw error;
    }
  }

}