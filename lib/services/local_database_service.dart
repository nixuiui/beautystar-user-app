import 'package:beautystar_user_app/models/account.dart';
import 'package:beautystar_user_app/models/library_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';

@singleton
class LocalDatabaseService {
  final apiTokenBox = Hive.box<String>('apiTokenBox');
  final accountBox = Hive.box<Account>('accountBox');
  final librariesBox = Hive.box<String>('librariesBox');
  
  // Account related
  void saveAccountToBox(Account data) => accountBox.put(0, data);
  Account getAccount() => accountBox.isNotEmpty ? accountBox.getAt(0) : null;
  bool isAccountBoxEmpty() => accountBox.isEmpty;
  
  // Api Token Related
  void saveApiTokenToBox(String token) => apiTokenBox.put(0, token);
  String getApiToken() => apiTokenBox?.getAt(0) ?? null;
  bool isLoggedIn() => apiTokenBox.isNotEmpty;
  void logout() => apiTokenBox.clear();
  
  // Libraries related
  void saveLibrariesToBox(List<LibraryModel> data) => librariesBox.put(0, libraryModelToJson(data));
  List<NxOptions<LibraryModel>> getLibrariesByCategory(CategoryEnum val) {
    return librariesBox.isNotEmpty 
      ? libraryModelFromJson(librariesBox.getAt(0))
      .where((e) => e.categoryId == categories[val])
      .map((e) => NxOptions(
        name: e.name,
        value: e
      )).toList() 
      : null;
  }
  List<NxOptions<LibraryModel>> getAllLibraries() {
    return librariesBox.isNotEmpty 
      ? libraryModelFromJson(librariesBox.getAt(0)).map((e) => NxOptions(
        name: e.name,
        value: e
      )).toList() 
      : null;
  }

  // Shared functionality
  void clearTempDB() {
    try {
      if (accountBox != null && accountBox.isNotEmpty) {
        accountBox.deleteAt(0);
      }
      if (apiTokenBox != null && apiTokenBox.isNotEmpty) {
        apiTokenBox.deleteAt(0);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void clearAllBoxes() {
    try {
      accountBox.clear();
      apiTokenBox.clear();
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteAllBoxes() {
    try {
      accountBox.deleteFromDisk();
      apiTokenBox.deleteFromDisk();
    } catch (e) {
      print(e.toString());
    }
  }
}