import 'package:beautystar_user_app/api/account_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/models/library_model.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:beautystar_user_app/ui/custom_dialogs/base_custom_dialog.dart';
import 'package:nx_flutter_ui_starter_pack/nx_options.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _localDatabaseService = locator<LocalDatabaseService>();
  
  var account = locator<LocalDatabaseService>().getAccount();
  var api = AccountApi();
  var genders = locator<LocalDatabaseService>().getLibrariesByCategory(CategoryEnum.Gender);
  var gender = NxOptions<LibraryModel>();

  var nameErrorText = '';
  var dateErrorText = '';
  var phoneNumberErrorText = '';
  var genderErrorText = '';

  Future init() async {
    gender = genders.firstWhere((e) => e.value.id == account?.gender?.id, orElse: () => null);
  }

  updateDate(DateTime date) {
    account.birthDate = date;
    notifyListeners();
  }

  updateGender(NxOptions<LibraryModel> data) {
    gender = data;
    account.gender = data.value;
    notifyListeners();
  }

  Future save() async {
    if(
      account?.nama != null && account?.nama != '' &&
      account?.birthDate != null &&
      account?.gender != null &&
      account?.noHp != null && account?.noHp != ''
    ) {
      try {
        setBusy(true);
        notifyListeners();
        await api.updateProfile(account: account);
        account = await api.me();
        _localDatabaseService.saveAccountToBox(account);
        await _dialogService.showCustomDialog(
          variant: DialogType.base,
          title: 'Berhasil',
          description: "Berhasil mengubah",
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
    nameErrorText = '';
    dateErrorText = '';
    phoneNumberErrorText = '';
    genderErrorText = '';
    notifyListeners();
  }

  setErrorText() {
    if(account?.nama == null || account?.nama == '')
      nameErrorText = 'Nama harus diisi';
    if(account?.birthDate == null)
      dateErrorText = 'Tanggal lahir harus diisi';
    if(account?.noHp == null || account?.noHp == '')
      nameErrorText = 'No HP harus diisi';
    if(account?.gender == null)
      nameErrorText = 'Jenis kelamin harus diisi';
    notifyListeners();
  }

}