import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';

abstract class ComodityRepository {
  Future<void> addComodity(String? token, String? farmerId, String? fruitId);
  Future<List<FruitModel?>?> getFruits(String? token);
}
