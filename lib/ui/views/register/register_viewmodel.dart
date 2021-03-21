import 'package:beautystar_user_app/api/account_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:beautystar_user_app/models/account.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:beautystar_user_app/ui/custom_dialogs/base_custom_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _localDatabaseService = locator<LocalDatabaseService>();

  var account = Account();
  var api = AccountApi();

  var nameErrorText = '';
  var dateErrorText = '';
  var phoneNumberErrorText = '';
  var usernameErrorText = '';
  var emailErrorText = '';
  var passwordErrorText = '';

  Future init() async {}

  navigateToHome() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }

  updateDate(DateTime date) {
    account.birthDate = date;
    notifyListeners();
  }

  Future register() async {
    if(
      account?.nama != null && account?.nama != '' &&
      account?.noHp != null && account?.noHp != '' &&
      account?.birthDate != null &&
      account?.username != null && account?.username != '' &&
      account?.email != null && account?.email != '' &&
      account?.password != null && account?.password != ''
    ) {
      try {
        setBusy(true);
        notifyListeners();
        account = await api.register(data: account);
        _localDatabaseService.saveAccountToBox(account);
        _localDatabaseService.saveApiTokenToBox(account.token);
        _navigationService.back();
        _navigationService.clearStackAndShow(Routes.homeLayout);
      } catch (error) {
        _dialogService.showCustomDialog(
          variant: DialogType.error,
          description: "$error",
          title: 'Failed'
        );
      }
    } else {
      setErrorText();
    }
    setBusy(false);
    notifyListeners();
  }

  resetErrorText() {
    nameErrorText = '';
    dateErrorText = '';
    phoneNumberErrorText = '';
    usernameErrorText = '';
    emailErrorText = '';
    passwordErrorText = '';
  }
  
  setErrorText() {
    if(account?.nama == null || account?.nama == '')
      nameErrorText = 'Nama tidak boleh kosong';
    if(account?.birthDate == null)
      dateErrorText = 'Tanggal lahir tidak boleh kosong';
    if(account?.noHp == null || account?.noHp == '')
      phoneNumberErrorText = 'Nomor HP tidak boleh kosong';
    if(account?.username == null || account?.username == '')
      usernameErrorText = 'Username tidak boleh kosong';
    if(account?.email == null || account?.email == '')
      emailErrorText = 'Email tidak boleh kosong';
    if(account?.password == null || account?.password == '')
      passwordErrorText = 'Password tidak boleh kosong';
    if((account?.password?.length ?? 0) < 6)
      passwordErrorText = 'Password minimal 6 karakter';
  }

}