import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_tani/core/error/error.dart';
import 'package:project_tani/feature/transaction/data/models/customer_transaction_model.dart';
import 'package:project_tani/feature/transaction/data/models/farmer_transaction_model.dart';

abstract class CustomerTransactionRemoteDataSource {
  Future<void> addCustomerTransaction(
      String? token,
      String? farmerTransactionId,
      String? weight,
      String? price,
      String? shippingPayment,
      String? totalPayment,
      String? shippingDate,
      String? address,
      String? receiverName,
      String? phoneNumber);
  Future<List<CustomerTransactionModel?>> getListCustomerTransaction(
      String? token);
  Future<CustomerTransactionModel?> getCustomerTransaction(
      String? token, String? id);
}

class CustomerTransactionRemoteDataSourceImpl
    implements CustomerTransactionRemoteDataSource {
  @override
  Future<void> addCustomerTransaction(
      String? token,
      String? farmerTransactionId,
      String? weight,
      String? price,
      String? shippingPayment,
      String? totalPayment,
      String? shippingDate,
      String? address,
      String? receiverName,
      String? phoneNumber) async {
    const api = 'http://192.168.1.9:8000/api/collector/transaction/customer';
    final data = {
      "fruit_comodity_id": farmerTransactionId,
      "weight": weight,
      "price": price,
      "shipping_payment": shippingPayment,
      "total_payment": totalPayment,
      "shipping_date": shippingDate,
      "address": address,
      "receiver_name": receiverName,
      "phone_number": phoneNumber,
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
  Future<List<CustomerTransactionModel?>> getListCustomerTransaction(
      String? token) async {
    const api = 'http://192.168.1.9:8000/api/collector/transaction/customer';

    final dio = Dio();
    Response response;
    try {
      response = await dio.get(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final body = response.data['data']['customer_transaction'];
        List<CustomerTransactionModel?> listCustomerTransactionModel =
            (body as Iterable)
                .map((e) => CustomerTransactionModel.fromJson(e))
                .toList();
        return listCustomerTransactionModel;
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
  Future<CustomerTransactionModel?> getCustomerTransaction(
      String? token, String? id) async {
    final api =
        'http://192.168.1.9:8000/api/collector/transaction/fcustomer/show/$id';

    final dio = Dio();
    Response response;
    try {
      response = await dio.get(api,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final body = response.data['data']['customer_transaction'];
        CustomerTransactionModel? customerTransactionModel =
            CustomerTransactionModel.fromJson(body);
        return customerTransactionModel;
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
