import 'package:equatable/equatable.dart';
import 'package:project_tani/core/usecase/usecase.dart';
import 'package:project_tani/feature/transaction/domain/entities/farmer_transaction.dart';
import 'package:project_tani/feature/transaction/domain/repositories/farmer_transaction.dart';

class GetFarmerTransactionUsecase
    implements UseCase<FarmerTransaction?, ParamsGetFarmerTransaction> {
  final FarmerTransactionRepository repository;

  GetFarmerTransactionUsecase(this.repository);

  @override
  Future<FarmerTransaction?> call(ParamsGetFarmerTransaction params) async {
    return await repository.getFarmerTransaction(params.token, params.id);
  }
}

class ParamsGetFarmerTransaction extends Equatable {
  final String? token;
  final String? id;

  const ParamsGetFarmerTransaction({required this.token, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [token, id];
}
