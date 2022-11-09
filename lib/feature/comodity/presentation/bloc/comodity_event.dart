part of 'comodity_bloc.dart';

abstract class ComodityEvent extends Equatable {
  const ComodityEvent();
}

class AddComodityEvent extends ComodityEvent {
  final String? token;
  final String? farmerId;
  final String? fruitId;
  const AddComodityEvent({
    this.token,
    this.farmerId,
    this.fruitId,
  });
  @override
  List<Object?> get props => [
        token,
        farmerId,
        fruitId,
      ];
}

class UpdateComodityEvent extends ComodityEvent {
  final String? token;
  final String? id;
  final String? blossomTreeDate;
  final String? harvestingDate;
  final String? fruitGrade;
  final int? weight;
  const UpdateComodityEvent(
      {this.token,
      this.id,
      this.blossomTreeDate,
      this.harvestingDate,
      this.fruitGrade,
      this.weight});
  @override
  List<Object?> get props =>
      [token, id, blossomTreeDate, harvestingDate, fruitGrade, weight];
}

class VerifyComodityEvent extends ComodityEvent {
  final String? token;
  final String? id;
  const VerifyComodityEvent({this.token, this.id});
  @override
  List<Object?> get props => [token, id];
}

class DeleteComodityEvent extends ComodityEvent {
  final String? token;
  final String? id;
  const DeleteComodityEvent({this.token, this.id});
  @override
  List<Object?> get props => [token, id];
}

class GetFruitEvent extends ComodityEvent {
  final String? token;
  const GetFruitEvent({
    this.token,
  });
  @override
  List<Object?> get props => [
        token,
      ];
}

class GetListComodityEvent extends ComodityEvent {
  final String? token;
  const GetListComodityEvent({
    this.token,
  });
  @override
  List<Object?> get props => [
        token,
      ];
}
