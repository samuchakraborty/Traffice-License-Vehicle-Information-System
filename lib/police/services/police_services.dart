import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traffice_information_system/police/models/license_model.dart';
import 'package:traffice_information_system/police/models/police_model.dart';
import 'package:traffice_information_system/police/models/vehicle_model.dart';

import '../../url.dart';

class PoliceRepository {

  Future policeSignUp({data}) async {
    final response = await Dio().post(
      policeSignUpUrl,
      //data: FormData.fromMap(data),
      queryParameters: data,
      // options: Options(contentType:("application/x-www-form-urlencoded"))
      // options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    print(response);
    if (response.statusCode == 201) {
      return response.data['policeId'];
    } else {
      throw Exception('expression is occur');
    }

    // print(response.body);
  }



  Future policeLogin({data}) async {
    final response = await Dio().post(
      policeLoginUrl, data: FormData.fromMap(data),
      // options: Options(contentType:("application/x-www-form-urlencoded"))
      // options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    print(response);
    if (response.statusCode == 200) {
      return response.data['data'];
    } else {
      throw Exception('expression is occur');
    }

    // print(response.body);
  }

  Future<PoliceInfo> getPoliceProfile({batchId}) async {
    Dio dios = new Dio();
    (dios.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    final response =
        await dios.get(policeProfileUrl, queryParameters: {'batchId': batchId});
    print(response.data);

    if (response.statusCode == 200) {
      return PoliceInfo.fromJson(response.data);
    } else {
      throw Exception('expression is occur');
    }
    // return null;
  }

  Future getVehicleInformation({vehicleNumber}) async {
    final response = await http.get(
      Uri.parse(searchVehicleUrl + '?vc=$vehicleNumber'),
    );
    //final jsonResponse = jsonDecode(response.data);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      return VehicleInfo.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      print(response.statusCode);
      print(response.body);

      return (response.body);
    } else {
      throw Exception('expression is occur');
    }
  }

  Future getLicenseInformation({licenseNumber}) async {
    final response = await Dio()
        .get(searchLicenseUrl, queryParameters: {'license': licenseNumber});
    //final jsonResponse = jsonDecode(response.data);
    print('samu');
    print(response.data);

    if (response.statusCode == 200) {
      print(response.statusCode);

      return LicenseInfo.fromJson(response.data);
    } else {
      throw Exception('expression is occur');
    }
  }
}
