import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';
import 'package:project_tani/feature/comodity/data/models/fruit_model.dart';

abstract class ComodityRepository {
  Future<void> addComodity(String? token, String? farmerId, String? fruitId);
  Future<List<FruitModel?>> getFruits(String? token);
  Future<List<ComodityModel?>> getListComodity(String? token);
  Future<void> updateComodity(
      String? token,
      String? id,
      String? blossomTreeDate,
      String? harvestingDate,
      String? fruitGrade,
      int? weight);
  Future<void> verifyComodity(String? token, String? id);
  Future<void> deleteComodity(String? token, String? id);
}
