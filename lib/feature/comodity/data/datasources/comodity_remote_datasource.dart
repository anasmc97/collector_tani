import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_tani/core/error/error.dart';

abstract class ComodityRemoteDataSource {
  Future<void> addComodity(String?token, String? farmerId, String? fruitId);
}

class ComodityRemoteDataSourceImpl implements ComodityRemoteDataSource{
  @override
  Future<void> addComodity(String? token, String? farmerId, String? fruitId) async {
    final api = 'http://192.168.1.7:8000/api/collector/comodity';
    final data = {"farmer_id": farmerId, "fruit_id": fruitId};

    final dio = Dio();
    try{
      await dio.post(api, data: data, options: Options(headers:{"Authorization":"Bearer $token"}));
    }catch (e){
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }

}