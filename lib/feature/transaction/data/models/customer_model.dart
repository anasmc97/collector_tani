import 'package:project_tani/feature/transaction/domain/entities/customer.dart';

class CustomerModel extends Customer {
  const CustomerModel({
    required String? id,
    required String? phoneNumber,
  }) : super(
          id: id,
          phoneNumber: phoneNumber,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone_number': phoneNumber,
    };
  }
}
