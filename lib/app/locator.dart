import 'package:beautystar_user_app/app/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);