import 'package:beautystar_user_app/models/account.dart';
import 'package:beautystar_user_app/models/library_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDB {
  static Future init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);

    Hive
      ..registerAdapter(LibraryModelAdapter())
      ..registerAdapter(AccountAdapter());

    await Hive.openBox<String>('apiTokenBox');
    await Hive.openBox<Account>('accountBox');
  }
}