import 'dart:io';

import 'package:beautystar_user_app/api/main_api.dart';
import 'package:beautystar_user_app/models/account.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

class AccountApi extends MainApi {

  Future<Account> login({String username, String password}) async {
    try {
      final response = await sendRequest(
        url: "$host/user/login",
        requestMethod: RequestMethod.POST,
        body: {
          "emailOrUsername" : username,
          "password" : password
        }
      );
      return accountFromJson(response);
    } catch (error) {
      throw error;
    }
  }
  
  Future<Account> register({Account data}) async {
    try {
      final response = await sendRequest(
        url: "$host/user/register",
        requestMethod: RequestMethod.POST,
        body: data.toJsonRegister()
      );
      return accountFromJson(response);
    } catch (error) {
      throw error;
    }
  }
  
  Future<bool> forgotPassword({String email}) async {
    try {
      await sendRequest(
        url: "$host/forgotpassword",
        requestMethod: RequestMethod.POST,
        body: {"email": email}
      );
      return true;
    } catch (error) {
      throw error;
    }
  }
  
  Future<Account> me() async {
    try {
      final response = await sendRequest(
        url: "$host/user/me",
        requestMethod: RequestMethod.GET
      );
      return accountFromJson(response);
    } catch (error) {
      throw error;
    }
  }

  Future<Account> updatePassword({String oldPassword, String password}) async {
    try {
      final response = await sendRequest(
        url: "$host/user/me/password",
        requestMethod: RequestMethod.PATCH,
        useAuth: true,
        body: {
          "oldPassword" : oldPassword,
          "password" : password
        }
      );
      return accountFromJson(response);
    } catch (error) {
      throw error;
    }
  }
  
  Future<Account> updatePhotoProfile({File photo}) async {
    try {
      var multiPartFile = await MultipartFile.fromFile(
        photo.path, 
        contentType: MediaType('image', lookupMimeType(photo.path))
      );
      
      final response = await sendRequest(
        url: "$host/user/profile-picture",
        requestMethod: RequestMethod.PATCH,
        useAuth: true,
        isFormData: true,
        body: {"photo": multiPartFile}
      );
      return accountFromJson(response);
    } catch (error) {
      print(error);
      throw error;
    }
  }

}