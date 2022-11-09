import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String? id;
  final String? phoneNumber;

  const Customer({this.id, this.phoneNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        phoneNumber,
      ];
}
