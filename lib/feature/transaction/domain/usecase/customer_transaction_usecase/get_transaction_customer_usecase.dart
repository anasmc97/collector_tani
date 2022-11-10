import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/transaction/domain/entities/customer_transaction.dart';
import 'package:project_tani/feature/transaction/domain/repositories/customer_transaction.dart';

class GetCustomerTransactionUsecase
    implements UseCase<CustomerTransaction?, ParamsGetCustomerTransaction> {
  final CustomerTransactionRepository repository;

  GetCustomerTransactionUsecase(this.repository);

  @override
  Future<CustomerTransaction?> call(ParamsGetCustomerTransaction params) async {
    return await repository.getCustomerTransaction(params.token, params.id);
  }
}

class ParamsGetCustomerTransaction extends Equatable {
  final String? token;
  final String? id;

  const ParamsGetCustomerTransaction({required this.token, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [token, id];
}
