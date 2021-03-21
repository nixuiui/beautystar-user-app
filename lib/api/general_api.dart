import 'package:beautystar_user_app/api/main_api.dart';
import 'package:beautystar_user_app/models/library_model.dart';

class GeneralApi extends MainApi {

  Future<List<LibraryModel>> loadLibraries() async {
    try {
      final response = await sendRequest(
        url: "$host/public/libraries",
        requestMethod: RequestMethod.GET
      );
      print("libraryModelFromJson(response): ${libraryModelFromJson(response)[0].categoryId}");
      return libraryModelFromJson(response);
    } catch (error) {
      throw error;
    }
  }

}