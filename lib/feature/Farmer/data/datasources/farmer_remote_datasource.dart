import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_tani/feature/Farmer/data/models/farmer_model.dart';
import 'package:project_tani/core/error/error.dart';

abstract class FarmerRemoteDataSource {
  Future<FarmerModel?> addFarmer(
      String? token,
      String? name,
      String? landLocation,
      String? numberTree,
      String? estimationProduction,
      String? landSize);
  Future<List<FarmerModel?>?> getAllFarmer(String? token);
  Future<FarmerModel?> updateFarmer(
      String? token,
      String? id,
      String? name,
      String? landLocation,
      String? numberTree,
      String? estimationProduction,
      String? landSize);
  Future<void> deleteFarmer(String? token, String? id);
}

class FarmerRemoteDataSourceImpl implements FarmerRemoteDataSource {
  @override
  Future<FarmerModel?> addFarmer(
      String? token,
      String? name,
      String? landLocation,
      String? numberTree,
      String? estimationProduction,
      String? landSize) async {
    final api = 'http://192.168.1.9:8000/api/collector/farmer';
    final data = {
      "name": name,
      "land_location": landLocation,
      "number_tree": numberTree,
      "estimation_production": estimationProduction,
      "land_size": landSize
    };

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
  Future<List<FarmerModel?>?> getAllFarmer(String? token) async {
    final api = 'http://192.168.1.9:8000/api/collector/farmer';

    final dio = Dio();
    Response response;
    try {
      response = await dio.get(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final body = response.data['data']['farmer'];
        List<FarmerModel?>? listFarmerModel =
            (body as Iterable).map((e) => FarmerModel.fromJson(e)).toList();
        return listFarmerModel;
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

  @override
  Future<void> deleteFarmer(String? token, String? id) async {
    final api = 'http://192.168.1.9:8000/api/collector/farmer/$id';

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
  Future<FarmerModel?> updateFarmer(
      String? token,
      String? id,
      String? name,
      String? landLocation,
      String? numberTree,
      String? estimationProduction,
      String? landSize) async {
    final api = 'http://192.168.1.9:8000/api/collector/farmer/$id';
    final data = {
      "name": name,
      "land_location": landLocation,
      "number_tree": numberTree,
      "estimation_production": estimationProduction,
      "land_size": landSize
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
}
