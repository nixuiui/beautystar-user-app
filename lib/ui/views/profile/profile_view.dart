import 'package:beautystar_user_app/ui/views/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:nx_flutter_ui_starter_pack/nx_image.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class ProfileView extends ViewModelBuilderWidget<ProfileViewModel> {

  @override
  bool get reactive => super.reactive;

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();

  @override
  void onViewModelReady(ProfileViewModel model) => model.init();

  @override
  Widget builder(BuildContext context, ProfileViewModel model, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            children: [
              buildHeader(model),
              buildMenu(model),
            ],
          ),
        ),
      ),
    );
  }

  Column buildMenu(ProfileViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NxText.subtitle("Pengaturan"),
        SizedBox(height: 8),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: NxText("Ubah Akun"),
          onTap: model.navigateToEditProfile,
        ),
        Divider(),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: NxText("Rekening Bank"),
        ),
        Divider(),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: NxText("Alamat"),
        ),
        Divider(),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: NxText("Ubah Password"),
          onTap: model.navigateToEditPassword,
        ),
        Divider(),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: NxText("Ubah Email"),
        ),
        Divider(),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: NxText("Logout"),
          onTap: model.logout,
        ),
      ],
    );
  }

  Widget buildHeader(ProfileViewModel model) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          NxImage.avatar(
            image: model?.account?.profilePhoto != null ? NetworkImage(model?.account?.profilePhoto) : null,
            size: 50,
            borderSize: 2,
            borderColor: Colors.grey[300],
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NxText.title(model?.account?.nama ?? ''),
              NxText.small(model?.account?.username ?? ''),
            ],
          )
        ],
      ),
    );
  }
}