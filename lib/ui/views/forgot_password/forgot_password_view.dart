import 'package:beautystar_user_app/helper/general_function.dart';
import 'package:beautystar_user_app/ui/views/forgot_password/forgot_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nx_flutter_ui_starter_pack/nx_button.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text_field.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class ForgotPasswordView extends ViewModelBuilderWidget<ForgotPasswordViewModel> {

  @override
  bool get reactive => super.reactive;

  @override
  ForgotPasswordViewModel viewModelBuilder(BuildContext context) => ForgotPasswordViewModel();

  @override
  void onViewModelReady(ForgotPasswordViewModel model) => model.init();

  @override
  Widget builder(BuildContext context, ForgotPasswordViewModel model, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lupa Password"),
          leading: backButton(context),
          bottom: appBarBorderBottom(),
        ),
        body: Column(
          children: [
            _buildForm(model),
            Divider(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Expanded _buildForm(ForgotPasswordViewModel model) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NxText("Masukan email Anda yang terdaftar."),
          SizedBox(height: 16),
          NxTextFieldBorderBottom(
            label: "Email",
          ),
        ],
      )
    );
  }

  Widget _buildButton() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: NxButton.primary(
        text: "Kirim Permintaan",
        onPressed: (){}
      ),
    );
  }
}