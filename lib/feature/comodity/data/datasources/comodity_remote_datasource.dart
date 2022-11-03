import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_tani/core/error/error.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';

abstract class ComodityRemoteDataSource {
  Future<void> addComodity(String? token, String? farmerId, String? fruitId);
  Future<List<FruitModel?>?> getFruits(String? token);
}

class ComodityRemoteDataSourceImpl implements ComodityRemoteDataSource {
  @override
  Future<void> addComodity(
      String? token, String? farmerId, String? fruitId) async {
    final api = 'http://192.168.1.7:8000/api/collector/comodity';
    final data = {"farmer_id": farmerId, "fruit_id": fruitId};

    final dio = Dio();
    try {
      await dio.post(api,
          data: data,
          options: Options(headers: {"Authorization": "Bearer $token"}));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }

  @override
  Future<List<FruitModel?>?> getFruits(String? token) async {
    final api = 'http://192.168.1.7:8000/api/collector/fruit';

    final dio = Dio();
    Response response;
    try {
      response = await dio.get(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final body = response.data['data']['fruits'];
        List<FruitModel?>? listFruitModel =
            (body as Iterable).map((e) => FruitModel.fromJson(e)).toList();
        return listFruitModel;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }
}
