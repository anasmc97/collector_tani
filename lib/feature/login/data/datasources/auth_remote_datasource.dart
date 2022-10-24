import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_tani/feature/login/data/models/auth_model.dart';

import 'package:project_tani/core/error/error.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel?> signUp(String? name, String? phoneNumber, String? email, String? password);
  Future<AuthModel?> login(String? email, String? password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<AuthModel?> signUp(String? name, String? phoneNumber, String? email, String? password) async {
    final api = 'http://192.168.1.11:8000/api/register';
    final data = {"name": name, "phone_number": phoneNumber, "email": email, "password": password};

    final dio = Dio();
    Response response;
    try{
      response = await dio.post(api, data: data);
      if (response.statusCode == 200) {
        final body = response.data['data']['user'];
        AuthModel authModel = AuthModel.fromJson(body);
        return authModel.copyWith(token: response.data['data']['token']);
      } else {
        return null;
      }
    }catch (e){
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }

  }

  @override
  Future<AuthModel?> login(String? email, String? password) async {
    final api = 'http://192.168.1.11:8000/api/login';
    final data = {"email": email, "password": password};
    Map<String, dynamic> header = {"Accept" : "application/json"};

    final dio = Dio();
    Response response;
    try{
      response = await dio.post(api,
          data: data,
      );
      if (response.statusCode == 200) {
        final body = response.data;
        return AuthModel.fromJson(body);
      } else {
        return null;
      }
    }catch (e){
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }
}