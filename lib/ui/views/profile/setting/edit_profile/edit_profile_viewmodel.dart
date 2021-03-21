import 'package:beautystar_user_app/api/account_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:beautystar_user_app/ui/custom_dialogs/base_custom_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final _localDatabaseService = locator<LocalDatabaseService>();
  final _dialogService = locator<DialogService>();
  
  var account = locator<LocalDatabaseService>().getAccount();
  var api = AccountApi();

  var obsecure1 = true;
  var obsecure2 = true;
  var obsecure3 = true;

  var oldPassword = '';
  var newPassword = '';
  var newPasswordConfirm = '';
  
  var oldPasswordErrorText = '';
  var newPasswordErrorText = '';
  var newPasswordConfirmErrorText = '';

  Future init() async {}

  toggleObsecure1() {
    obsecure1 = !obsecure1;
    notifyListeners();
  }
  
  toggleObsecure2() {
    obsecure2 = !obsecure2;
    notifyListeners();
  }
  
  toggleObsecure3() {
    obsecure3 = !obsecure3;
    notifyListeners();
  }

  Future save() async {
    if(
      oldPassword != null && oldPassword != '' &&
      newPassword != null && newPassword != '' &&
      newPasswordConfirm != null && newPasswordConfirm != ''
    ) {
      try {
        setBusy(true);
        notifyListeners();
        await api.updatePassword(oldPassword: oldPassword, password: newPassword);
        await _dialogService.showCustomDialog(
          variant: DialogType.base,
          title: 'Berhasil',
          description: "Berhasil mengubah password",
          mainButtonTitle: 'OK',
        );
        _navigationService.back();
      } catch (error) {
        _dialogService.showCustomDialog(
          variant: DialogType.error,
          title: 'Failed',
          description: error.toString(),
          mainButtonTitle: 'OK',
        );
      }
    } else {
      setErrorText();
    }
    setBusy(false);
    notifyListeners();
  }

  resetErrorText() {
    oldPasswordErrorText = '';
    newPasswordErrorText = '';
    newPasswordConfirmErrorText = '';
    notifyListeners();
  }

  setErrorText() {
    if(oldPassword == null || oldPassword == '')
      oldPasswordErrorText = 'Password lama harus diisi';
    if(newPassword == null || newPassword == '')
      newPasswordErrorText = 'Password lama harus diisi';
    if(newPassword != newPasswordConfirm)
      newPasswordConfirmErrorText = 'Password harus sama';
    notifyListeners();
  }

}