import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_tani/core/error/error.dart';
import 'package:project_tani/feature/transaction/data/models/farmer_transaction_model.dart';

abstract class FarmerTransactionRemoteDataSource {
  Future<void> addFarmerTransaction(String? token, String? fruitComodityId,
      int? weight, int? price, int? priceTotal);
  Future<List<FarmerTransactionModel?>> getListFarmerTransaction(String? token);
  Future<FarmerTransactionModel?> getFarmerTransaction(
      String? token, String? id);
}

class FarmerTransactionRemoteDataSourceImpl
    implements FarmerTransactionRemoteDataSource {
  @override
  Future<void> addFarmerTransaction(String? token, String? fruitComodityId,
      int? weight, int? price, int? priceTotal) async {
    final api = 'http://192.168.1.6:8000/api/collector/transaction/farmer';
    final data = json.encode({
      "fruit_comodity_id": fruitComodityId,
      "weight": weight,
      "price": price,
      "price_total": priceTotal
    });

    final dio = Dio();
    try {
      await dio.post(
        api,
        data: data,
        options: Options(
            headers: {"Authorization": "Bearer $token"},
            contentType: "application/json"),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Error.checkException(e);
    }
  }

  @override
  Future<List<FarmerTransactionModel?>> getListFarmerTransaction(
      String? token) async {
    const api = 'http://192.168.1.6:8000/api/collector/transaction/farmer';

    final dio = Dio();
    Response response;
    try {
      response = await dio.get(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final body = response.data['data']['farmer_transaction'];
        List<FarmerTransactionModel?> listFarmerTransactionModel =
            (body as Iterable)
                .map((e) => FarmerTransactionModel.fromJson(e))
                .toList();
        return listFarmerTransactionModel;
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
  Future<FarmerTransactionModel?> getFarmerTransaction(
      String? token, String? id) async {
    final api =
        'http://192.168.1.6:8000/api/collector/transaction/farmer/show/$id';

    final dio = Dio();
    Response response;
    try {
      response = await dio.get(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final body = response.data['data']['farmer_transaction'];
        FarmerTransactionModel? farmerTransactionModel =
            FarmerTransactionModel.fromJson(body);
        return farmerTransactionModel;
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
