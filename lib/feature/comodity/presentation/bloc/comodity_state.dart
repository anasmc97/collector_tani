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
