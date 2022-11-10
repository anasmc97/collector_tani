import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/transaction/domain/entities/customer_transaction.dart';
import 'package:project_tani/feature/transaction/domain/repositories/customer_transaction.dart';

class GetListCustomerTransactionUsecase
    implements
        UseCase<List<CustomerTransaction?>, ParamsGetListCustomerTransaction> {
  final CustomerTransactionRepository repository;

  GetListCustomerTransactionUsecase(this.repository);

  @override
  Future<List<CustomerTransaction?>> call(
      ParamsGetListCustomerTransaction params) async {
    return await repository.getListCustomerTransaction(params.token);
  }
}

class ParamsGetListCustomerTransaction extends Equatable {
  final String? token;

  const ParamsGetListCustomerTransaction({
    required this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
