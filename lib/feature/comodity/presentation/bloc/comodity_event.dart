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
