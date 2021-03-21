import 'package:beautystar_user_app/helper/general_function.dart';
import 'package:beautystar_user_app/ui/views/profile/setting/edit_profile/edit_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nx_flutter_ui_starter_pack/nx_button.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text_field.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class EditProfileView extends ViewModelBuilderWidget<EditProfileViewModel> {

  @override
  bool get reactive => super.reactive;

  @override
  EditProfileViewModel viewModelBuilder(BuildContext context) => EditProfileViewModel();

  @override
  void onViewModelReady(EditProfileViewModel model) => model.init();

  @override
  Widget builder(BuildContext context, EditProfileViewModel model, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ubah Profile"),
          leading: backButton(context),
          bottom: appBarBorderBottom(),
        ),
        body: Column(
          children: [
            _buildForm(model),
            Divider(),
            _buildButton(model),
          ],
        ),
      ),
    );
  }

  Expanded _buildForm(EditProfileViewModel model) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NxTextFieldBorderBottom(
            label: "Password Lama",
            isObsecure: model.obsecure1,
            controller: TextEditingController()
              ..text = model.oldPassword
              ..selection = TextSelection.collapsed(
                offset: model?.oldPassword?.length ?? 0
              ),
            onChanged: (val) => model.oldPassword = val,
            textError: model.oldPasswordErrorText,
          ),
          SizedBox(height: 32),
          NxTextFieldBorderBottom(
            label: "Password Baru",
            isObsecure: model.obsecure2,
            controller: TextEditingController()
              ..text = model.newPassword
              ..selection = TextSelection.collapsed(
                offset: model?.newPassword?.length ?? 0
              ),
            onChanged: (val) => model.newPassword = val,
            textError: model.newPasswordErrorText,
          ),
          SizedBox(height: 32),
          NxTextFieldBorderBottom(
            label: "Konfirmasi Password Baru",
            isObsecure: model.obsecure3,
            controller: TextEditingController()
              ..text = model.newPasswordConfirm
              ..selection = TextSelection.collapsed(
                offset: model?.newPasswordConfirm?.length ?? 0
              ),
            onChanged: (val) => model.newPasswordConfirm = val,
            textError: model.newPasswordConfirmErrorText,
          ),
        ],
      )
    );
  }

  Widget _buildButton(EditProfileViewModel model) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: NxButton.primary(
        text: "Simpan Perubahan",
        isLoading: model.isBusy,
        onPressed: model.save,
      ),
    );
  }
}