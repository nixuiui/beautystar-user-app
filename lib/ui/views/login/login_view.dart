import 'package:beautystar_user_app/helper/general_function.dart';
import 'package:beautystar_user_app/ui/views/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nx_flutter_ui_starter_pack/nx_button.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text_field.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class LoginView extends ViewModelBuilderWidget<LoginViewModel> {

  @override
  bool get reactive => super.reactive;

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel model) => model.init();

  @override
  Widget builder(BuildContext context, LoginViewModel model, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Masuk"),
          leading: backButton(context),
          bottom: appBarBorderBottom(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              _buildForm(model),
              Divider(),
              _buildButton(model),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildForm(LoginViewModel model) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NxTextFieldBorderBottom(
            label: "Username/Email",
            controller: TextEditingController()
              ..text = model.username
              ..selection = TextSelection.collapsed(
                offset: model?.username?.length ?? 0
              ),
            onChanged: (val) => model.username = val,
            textError: model.errorUsername,
          ),
          SizedBox(height: 32),
          NxTextFieldBorderBottom(
            label: "Kata Sandi",
            isObsecure: true,
            suffixIcon: Icons.visibility,
            controller: TextEditingController()
              ..text = model.password
              ..selection = TextSelection.collapsed(
                offset: model?.password?.length ?? 0
              ),
            onChanged: (val) => model.password = val,
            textError: model.errorPassword,
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NxText.primary(
                "Buat Akun Baru",
                onPressed: model.navigateToRegister,
              ),
              SizedBox(height: 8),
              NxText.primary(
                "Lupa Password",
                onPressed: model.navigateToForgotPassword,
              ),
            ],
          )
        ],
      )
    );
  }

  Widget _buildButton(LoginViewModel model) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: NxButton.primary(
        text: "Masuk",
        isLoading: model.isBusy,
        onPressed: () => model.login(),
      ),
    );
  }
}