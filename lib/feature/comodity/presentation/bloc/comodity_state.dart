part of 'comodity_bloc.dart';

abstract class ComodityState extends Equatable {
  const ComodityState();
}

class ComodityInitial extends ComodityState {
  @override
  List<Object> get props => [];
}

class AddComoditySucces extends ComodityState {
  @override
  List<Object> get props => [];
}

class GetFruitSuccess extends ComodityState {
  final List<Fruit?>? listFruit;
  const GetFruitSuccess({this.listFruit});
  @override
  List<Object?> get props => [listFruit];
}

class ComodityLoading extends ComodityState {
  @override
  List<Object> get props => [];
}

class ComodityDataError extends ComodityState {
  final String? message;
  const ComodityDataError({required this.message});
  @override
  List<Object?> get props => [message];
}

class FruitDataError extends ComodityState {
  final String? message;
  const FruitDataError({required this.message});
  @override
  List<Object?> get props => [message];
}

class FruitEmpty extends ComodityState {
  @override
  List<Object?> get props => [];
}
