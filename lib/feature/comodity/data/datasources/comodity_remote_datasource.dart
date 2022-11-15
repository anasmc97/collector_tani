import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_tani/core/error/error.dart';
import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';

abstract class ComodityRemoteDataSource {
  Future<void> addComodity(String? token, String? farmerId, String? fruitId);
  Future<List<FruitModel?>> getFruits(String? token);
  Future<List<ComodityModel?>> getListComodity(String? token);
  Future<List<ComodityModel?>> getListComodityVerified(String? token);
  Future<void> updateComodity(
      String? token,
      String? id,
      String? blossomTreeDate,
      String? harvestingDate,
      String? fruitGrade,
      int? weight);
  Future<void> verifyComodity(String? token, String? id);
  Future<void> deleteComodity(String? token, String? id);
}

class ComodityRemoteDataSourceImpl implements ComodityRemoteDataSource {
  @override
  Future<void> addComodity(
      String? token, String? farmerId, String? fruitId) async {
    final api = 'http://192.168.1.9:8000/api/collector/comodity';
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
  Future<List<FruitModel?>> getFruits(String? token) async {
    final api = 'http://192.168.1.9:8000/api/collector/fruit';

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
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }

  @override
  Future<List<ComodityModel?>> getListComodity(String? token) async {
    final api = 'http://192.168.1.9:8000/api/collector/comodity';

    final dio = Dio();
    Response response;
    try {
      response = await dio.get(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final body = response.data['data']['fruit_comodity'];
        List<ComodityModel?>? listComodityModel =
            (body as Iterable).map((e) => ComodityModel.fromJson(e)).toList();
        return listComodityModel;
      } else {
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }

  @override
  Future<void> updateComodity(
      String? token,
      String? id,
      String? blossomTreeDate,
      String? harvestingDate,
      String? fruitGrade,
      int? weight) async {
    final api = 'http://192.168.1.9:8000/api/collector/comodity/$id';
    final data = {
      "blossoms_tree_date": blossomTreeDate,
      "harvesting_date": harvestingDate,
      "fruit_grade": fruitGrade,
      "weight": weight
    };

    final dio = Dio();
    try {
      await dio.put(api,
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
  Future<void> verifyComodity(String? token, String? id) async {
    final api = 'http://192.168.1.9:8000/api/collector/comodity/verify/$id';

    final dio = Dio();
    try {
      await dio.put(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }

  @override
  Future<void> deleteComodity(String? token, String? id) async {
    final api = 'http://192.168.1.9:8000/api/collector/comodity/$id';

    final dio = Dio();
    try {
      await dio.delete(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }

  @override
  Future<List<ComodityModel?>> getListComodityVerified(String? token) async {
    const api = 'http://192.168.1.9:8000/api/collector/comodity/list/verified/';

    final dio = Dio();
    Response response;
    try {
      response = await dio.get(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final body = response.data['data']['fruit_comodity'];
        List<ComodityModel?>? listComodityModel =
            (body as Iterable).map((e) => ComodityModel.fromJson(e)).toList();
        return listComodityModel;
      } else {
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }
}
