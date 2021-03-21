import 'package:beautystar_user_app/helper/general_function.dart';
import 'package:beautystar_user_app/ui/views/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nx_flutter_ui_starter_pack/nx_button.dart';
import 'package:nx_flutter_ui_starter_pack/nx_select_box.dart';
import 'package:nx_flutter_ui_starter_pack/nx_select_date.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text_field.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends ViewModelBuilderWidget<RegisterViewModel> {

  @override
  bool get reactive => super.reactive;

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) => RegisterViewModel();

  @override
  void onViewModelReady(RegisterViewModel model) => model.init();

  @override
  Widget builder(BuildContext context, RegisterViewModel model, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Buat Akun Baru"),
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

  Expanded _buildForm(RegisterViewModel model) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NxTextFieldBorderBottom(
            label: "Nama",
            controller: TextEditingController()
              ..text = model?.account?.nama ?? ''
              ..selection = TextSelection.collapsed(
                offset: model?.account?.nama?.length ?? 0
              ),
            onChanged: (val) => model.account.nama = val,
            textError: model.nameErrorText,
          ),
          SizedBox(height: 32),
          NxSelectBox(
            label: "Jenis Kelamin",
            text: model?.gender?.name ?? '',
            options: model.genders,
            selected: model?.gender,
            onSelected: (val) => model.updateGender(val)
          ),
          SizedBox(height: 32),
          NxSelectDate(
            label: "Tanggal Lahir",
            onSelected: model.updateDate,
            text: model?.account?.birthDate != null ? DateFormat.yMEd().format(model.account.birthDate) : '',
            textError: model.dateErrorText,
          ),
          SizedBox(height: 32),
          NxTextFieldBorderBottom(
            label: "Nomor HP",
            textHint: "08xxxxx",
            inputType: TextInputType.phone,
            controller: TextEditingController()
              ..text = model?.account?.noHp ?? ''
              ..selection = TextSelection.collapsed(
                offset: model?.account?.noHp?.length ?? 0
              ),
            onChanged: (val) => model.account.noHp = val,
            textError: model.phoneNumberErrorText,
          ),
          SizedBox(height: 32),
          NxTextFieldBorderBottom(
            label: "Username",
            controller: TextEditingController()
              ..text = model?.account?.username ?? ''
              ..selection = TextSelection.collapsed(
                offset: model?.account?.username?.length ?? 0
              ),
            onChanged: (val) => model.account.username = val,
            textError: model.usernameErrorText,
          ),
          SizedBox(height: 32),
          NxTextFieldBorderBottom(
            label: "Email",
            inputType: TextInputType.emailAddress,
            controller: TextEditingController()
              ..text = model?.account?.email ?? ''
              ..selection = TextSelection.collapsed(
                offset: model?.account?.email?.length ?? 0
              ),
            onChanged: (val) => model.account.email = val,
            textError: model.emailErrorText,
          ),
          SizedBox(height: 32),
          NxTextFieldBorderBottom(
            label: "Kata Sandi",
            isObsecure: true,
            textHint: "Minimal 6 karakter",
            suffixIcon: Icons.visibility,
            controller: TextEditingController()
              ..text = model?.account?.password ?? ''
              ..selection = TextSelection.collapsed(
                offset: model?.account?.password?.length ?? 0
              ),
            onChanged: (val) => model.account.password = val,
            textError: model.passwordErrorText,
          ),
          SizedBox(height: 32),
        ],
      )
    );
  }

  Widget _buildButton(RegisterViewModel model) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: NxButton.primary(
        text: "Register",
        isLoading: model.isBusy,
        onPressed: model.register,
      ),
    );
  }
}