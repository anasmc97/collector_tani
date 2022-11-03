import 'package:equatable/equatable.dart';

class Fruit extends Equatable {
  final String? id;
  final String? name;

  const Fruit({this.id, this.name});
  @override
  List<Object?> get props => [id, name];
}
