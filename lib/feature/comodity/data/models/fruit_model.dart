import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';

class FruitModel extends Fruit {
  const FruitModel({
    required String? id,
    required String? name,
  }) : super(
          id: id,
          name: name,
        );

  factory FruitModel.fromJson(Map<String, dynamic> json) {
    return FruitModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
