import 'package:dio/dio.dart';
import 'package:traffice_information_system/admin/models/user_model.dart';
import 'package:traffice_information_system/admin/models/vehicle_model.dart';

import '../../url.dart';

class AdminRepository {
  Future<User> getUserInformation() async {
    final response = await Dio().get(adminGetUserUrl);
    //final jsonResponse = jsonDecode(response.data);
    print('samu');
    print(response.data);

    if (response.statusCode == 200) {
      print(response.statusCode);

      return User.fromJson(response.data);
    } else {
      throw Exception('expression is occur');
    }
  }

  Future<Vechile> getVehicleInformation() async {
    final response = await Dio().get(adminGetVechileUrl);
    //final jsonResponse = jsonDecode(response.data);
    print('samu');
    print(response.data);

    if (response.statusCode == 200) {
      print(response.statusCode);

      return Vechile.fromJson(response.data);
    } else {
      throw Exception('expression is occur');
    }
  }
}
