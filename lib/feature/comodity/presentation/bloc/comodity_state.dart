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

class UpdateComoditySucces extends ComodityState {
  @override
  List<Object> get props => [];
}

class DeleteComoditySucces extends ComodityState {
  @override
  List<Object> get props => [];
}

class VerifyComoditySucces extends ComodityState {
  @override
  List<Object> get props => [];
}

class GetFruitSuccess extends ComodityState {
  final List<Fruit?> listFruit;
  const GetFruitSuccess({this.listFruit = const []});
  @override
  List<Object?> get props => [listFruit];
}

class GetListComoditySuccess extends ComodityState {
  final List<ComodityModel?> listComodity;
  const GetListComoditySuccess({this.listComodity = const []});
  @override
  List<Object?> get props => [listComodity];
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

class ComodityEmpty extends ComodityState {
  @override
  List<Object?> get props => [];
}
