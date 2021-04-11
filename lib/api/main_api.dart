import 'dart:convert';
import 'dart:io';
import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

enum RequestMethod { GET, POST, PATCH, PUT, DELETE }

class MainApi {
  String host = 'http://103.126.226.184/api/v1';
  Dio dio = Dio();
  String get getHost => host;
  LocalDatabaseService _localDatabaseService = locator<LocalDatabaseService>();

  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "",
  };

  Future<String> sendRequest({
    String url,
    Object body,
    RequestMethod requestMethod,
    bool useAuth = false,
    bool isFormData = false
  }) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) throw "no_internet";
    var apiToken = _localDatabaseService.isLoggedIn() ? _localDatabaseService?.getApiToken() : null;
    if(useAuth)
      this.headers[HttpHeaders.authorizationHeader] = "Bearer $apiToken";
    if(useAuth)
      this.headers[HttpHeaders.contentTypeHeader] = Headers.formUrlEncodedContentType;
    print('REQUEST_POST: $url');
    print('REQUEST_HEADER: $headers');
    print('REQUEST_BODY: $body');
    try {
      final response = await request(
        url: url,
        body: body,
        requestMethod: requestMethod,
        useAuth: useAuth,
        isFormData: isFormData
      );
      print("RESPONSE_CODE: " + response.statusCode.toString());
      print("RESPONSE_BODY: " + response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonEncode(jsonDecode(response.data)['data']);
      } else if (response.statusCode == 400 || response.statusCode == 401) {
        throw jsonDecode(response.data)['message'];
      } else if (response.statusCode == 500) {
        throw "Server Error";
      } else {
        throw 'Failed to Load';
      }
    } catch (error) {
        throw error;
    }
  }

  Future<Response<String>> request({
    String url,
    Object body,
    RequestMethod requestMethod,
    bool useAuth = false,
    bool isFormData = false
  }) async {
    try {
      Response<String> response;
      switch (requestMethod) {
        case RequestMethod.GET:
          response = await dio.get<String>(
            url,
            options: Options(
              headers: this.headers,
              validateStatus: (status) => true
            )
          );
          break;
        case RequestMethod.POST:
          response = await dio.post<String>(
            url, 
            data: isFormData ? FormData.fromMap(body as Map<String, dynamic>) : jsonEncode(body),
            options: Options(
              headers: this.headers,
              validateStatus: (status) => true,
              contentType: isFormData ? Headers.formUrlEncodedContentType : Headers.jsonContentType
            )
          );
          break;
        case RequestMethod.PATCH:
          response = await dio.patch<String>(
            url,
            data: isFormData ? FormData.fromMap(body as Map<String, dynamic>) : jsonEncode(body),
            options: Options(
              headers: this.headers,
              validateStatus: (status) => true,
              contentType: isFormData ? Headers.formUrlEncodedContentType : Headers.jsonContentType
            )
          );
          break;
        case RequestMethod.PUT:
          response = await dio.put<String>(
            url,
            options: Options(
              headers: this.headers,
              validateStatus: (status) => true
            )
          );
          break;
        case RequestMethod.DELETE:
          response = await dio.delete<String>(
            url,
            options: Options(
              headers: this.headers,
              validateStatus: (status) => true
            )
          );
          break;
        default:
      }
      return response;
    } catch (error) {
      throw error;
    }
  }
}