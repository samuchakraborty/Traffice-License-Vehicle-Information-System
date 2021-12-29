import 'package:dio/dio.dart';
import 'package:traffice_information_system/admin/models/user_model.dart';
import 'package:traffice_information_system/admin/models/vehicle_model.dart';

import '../../url.dart';

class AdminRepository {

  Future getStolenInformation() async {
    final response = await Dio().get(stolenVehicleInformation);
    //final jsonResponse = jsonDecode(response.data);
    print('samu');
    print(response.data);

    if (response.statusCode == 200) {
      print(response.statusCode);

      return response.data;
    } else {
      throw Exception('expression is occur');
    }
  }




  Future<User> getUserInformation() async {
    final response = await Dio().get(adminGetUserUrl);
    //final jsonResponse = jsonDecode(response.data);
    print('samu');

    print(adminGetUserUrl);

    if (response.statusCode == 200) {
      print(response.data);

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

  Future adminLogin({data}) async {
    print(adminLoginUrl);
    final response = await Dio().post(
      adminLoginUrl, data: FormData.fromMap(data),
      // options: Options(contentType:("application/x-www-form-urlencoded"))
      // options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    print(adminLoginUrl);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('expression is occur');
    }

    // print(response.body);
  }

  Future updateLicenseInformation({licenseNo}) async {
    print(updateLicenseUrl);
    final response = await Dio().post(updateLicenseUrl,
        queryParameters: {'license': licenseNo}
        // options: Options(contentType:("application/x-www-form-urlencoded"))
        // options: Options(contentType: Headers.formUrlEncodedContentType),
        );
    print(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('expression is occur');
    }

    // print(response.body);
  }

  Future updateExamDate({licenseNo, required String examDate}) async {
    print(updateExamDateUrl);
    print({'license': licenseNo, 'examDate': examDate});
    final response = await Dio().post(updateExamDateUrl,
        queryParameters: {'license': licenseNo, 'examDate': examDate.toString()}
      // options: Options(contentType:("application/x-www-form-urlencoded"))
      // options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    print({'license': licenseNo, 'examDate': examDate.toString()});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('expression is occur');
    }

    // print(response.body);
  }






}
