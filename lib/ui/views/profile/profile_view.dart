import 'package:beautystar_user_app/app/app_consts.dart';
import 'package:beautystar_user_app/ui/views/profile/profile_viewmodel.dart';
import 'package:beautystar_user_app/ui/widgets/components/camera_page.dart';
import 'package:beautystar_user_app/ui/widgets/components/photo_viewer.dart';
import 'package:beautystar_user_app/ui/widgets/components/select_from_gallery.dart';
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
              buildHeader(model, context),
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

  Widget buildHeader(ProfileViewModel model, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          NxBox(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: model.isUploadingPhoto ? NxLoadingSpinner() : NxImage.avatar(
              image: model?.account?.profilePhoto != null ? NetworkImage(model?.account?.profilePhoto) : null,
              size: 50,
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Container(
                    height: 220,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        NxBox(
                          height: 50,
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PhotoViewer(imageNetwork: model.account.profilePhoto)
                            ));
                          },
                          padding: 16,
                          color: Colors.grey[200],
                          borderRadius: 4,
                          child: Row(
                            children: [
                              Icon(Icons.visibility, size: 18),
                              SizedBox(width: 16),
                              Text("Lihat Foto"),
                            ],
                          )
                        ),
                        SizedBox(height: 16),
                        NxBox(
                          height: 50,
                          onPressed: () {
                            Navigator.pop(context);
                            takePicture(context, model);
                          },
                          padding: 16,
                          color: Colors.grey[200],
                          borderRadius: 4,
                          child: Row(
                            children: [
                              Icon(Icons.photo_camera, size: 18),
                              SizedBox(width: 16),
                              Text("Ambil Foto"),
                            ],
                          )
                        ),
                        SizedBox(height: 16),
                        NxBox(
                          height: 50,
                          onPressed: () {
                            Navigator.pop(context);
                            selectFromGallery(context, model);
                          },
                          padding: 16,
                          color: Colors.grey[200],
                          borderRadius: 4,
                          child: Row(
                            children: [
                              Icon(Icons.photo, size: 18),
                              SizedBox(width: 16),
                              Text("Pilih dari Galery"),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
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

  Future takePicture(BuildContext context, ProfileViewModel model) async {
    Map results = await Navigator.push(context, MaterialPageRoute(
      builder: (context) => CameraPage(
        selectedCameraIdx: 1, 
        scale: 1/1,
        subtitle: "Ambil Foto",
        flipable: true,
      )
    ));

    if (results != null && results.containsKey("file")) {
      model.uploadPhoto(results["file"], context);
    }
  }
  
  Future selectFromGallery(BuildContext context, ProfileViewModel model) async {
    Map results = await Navigator.push(context, MaterialPageRoute(
      builder: (context) => SelectFromGallery()
    ));

    if (results != null && results.containsKey("file")) {
      model.uploadPhoto(results["file"], context);
    }
  }
}