import 'package:auto_route/auto_route_annotations.dart';
import 'package:beautystar_user_app/ui/views/forgot_password/forgot_password_view.dart';
import 'package:beautystar_user_app/ui/views/home/home_view.dart';
import 'package:beautystar_user_app/ui/views/home_layout/home_layout_view.dart';
import 'package:beautystar_user_app/ui/views/login/login_view.dart';
import 'package:beautystar_user_app/ui/views/mua/mua_view.dart';
import 'package:beautystar_user_app/ui/views/mua_detail/mua_detail_view.dart';
import 'package:beautystar_user_app/ui/views/profile/profile_view.dart';
import 'package:beautystar_user_app/ui/views/profile/setting/edit_password/edit_password_view.dart';
import 'package:beautystar_user_app/ui/views/profile/setting/edit_profile/edit_profile_view.dart';
import 'package:beautystar_user_app/ui/views/register/register_view.dart';
import 'package:beautystar_user_app/ui/views/search_mua/search_mua_view.dart';
import 'package:beautystar_user_app/ui/views/splash/splash_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: HomeLayoutView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: EditPasswordView),
    MaterialRoute(page: EditProfileView),
    MaterialRoute(page: MuaView),
    MaterialRoute(page: MuaDetailView),
    MaterialRoute(page: SearchMuaView),
  ],
)
class $Router {}