import 'package:project_tani/feature/Farmer/data/models/farmer_model.dart';

abstract class FarmerRepository {
  Future<FarmerModel?> addFarmer(String?token, String? name, String? landLocation, String? numberTree, String? estimationProduction, String? landSize);
  Future<List<FarmerModel?>?> getAllFarmer(String? token);
  Future<FarmerModel?> updateFarmer(String?token, String? id, String? name, String? landLocation, String? numberTree, String? estimationProduction, String? landSize);
  Future<void> deleteFarmer(String?token, String? id);
}