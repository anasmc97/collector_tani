import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/transaction/domain/entities/farmer_transaction.dart';
import 'package:project_tani/feature/transaction/domain/repositories/farmer_transaction.dart';

class GetListFarmerTransactionUsecase
    implements
        UseCase<List<FarmerTransaction?>, ParamsGetListFarmerTransaction> {
  final FarmerTransactionRepository repository;

  GetListFarmerTransactionUsecase(this.repository);

  @override
  Future<List<FarmerTransaction?>> call(
      ParamsGetListFarmerTransaction params) async {
    return await repository.getListFarmerTransaction(params.token);
  }
}

class ParamsGetListFarmerTransaction extends Equatable {
  final String? token;

  const ParamsGetListFarmerTransaction({
    required this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
