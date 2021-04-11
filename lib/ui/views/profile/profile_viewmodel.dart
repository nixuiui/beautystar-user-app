import 'dart:io';

import 'package:beautystar_user_app/api/account_api.dart';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/app/router.gr.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:beautystar_user_app/ui/custom_dialogs/base_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final _localDatabaseService = locator<LocalDatabaseService>();
  final _dialogService = locator<DialogService>();
  final api = AccountApi();
  
  var account = locator<LocalDatabaseService>().getAccount();

  bool isUploadingPhoto = false;

  Future init() async {}

  navigateToEditPassword() {
    _navigationService.navigateTo(Routes.editPasswordView);
  }

  navigateToEditProfile() {
    _navigationService.navigateTo(Routes.editProfileView);
  }

  uploadPhoto(File photo, BuildContext context) async {
    if(photo.lengthSync() > 3000000) {
      _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Failed',
        description: "Size gambar tidak boleh melebihi 2MB",
        mainButtonTitle: 'OK',
      );
    } else {
      try {
        isUploadingPhoto = true;
        notifyListeners();
        await api.updatePhotoProfile(photo: photo);
        final response = await api.me();
        account = response;
        _localDatabaseService.saveAccountToBox(account);
        isUploadingPhoto = false;
        notifyListeners();
      } catch (error) {
        isUploadingPhoto = false;
        notifyListeners();
      }
    }
  }

  logout() {
    _localDatabaseService.logout();
    _navigationService.clearStackAndShow(Routes.homeLayoutView);
  }

}