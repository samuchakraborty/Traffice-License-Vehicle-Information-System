import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

final userNotifier =
    ChangeNotifierProvider<NetworkHelper>((_) => NetworkHelper());

class NetworkHelper extends ChangeNotifier {
  static const String BASE_URL = "http://10.0.2.2:3000/user";

  Future login({data}) async {
    String url = BASE_URL + '/signin';

    final response = await Dio().post(
      url, data: FormData.fromMap(data),
      //   options: Options(contentType:("application/x-www-form-urlencoded"))
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    //final jsonResponse = jsonDecode(response.data);
    // print(response);

    if (response.statusCode == 200) {
      //   print(response.data);
      // print(url);
      return response.data['data'];
    } else {
      throw Exception('expression is occur');
    }

    // print(response.body);
  }

  Future userProfile({nidValue}) async {
    String url = BASE_URL + '/userprofile/$nidValue';

    Dio dios = new Dio();
    (dios.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    final response = await dios.get((url));
    // print(response);
    // print(url);
    //  final jsonResponse = jsonDecode(response.data);
    if (response.statusCode == 200) {
      //   print(jsonResponse);
      // UserProfile userInfo = new UserProfile.fromJson(jsonResponse);
      //   print(userInfo.status);
      //   return userInfo;
      return (response.data);
      notifyListeners();
    } else {
      throw Exception('expression is occur');
    }
    // return null;
  }

  Future applyLicense({data}) async {
    String url = BASE_URL + '/applyLicense';

    final response = await Dio().post(
      url, data: (data),
      //   options: Options(contentType:("application/x-www-form-urlencoded"))
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    //final jsonResponse = jsonDecode(response.data);
    //print(response);

    if (response.statusCode == 200) {
      // print(response.statusCode);
      //  print(url);
      return response.data;
    } else {
      throw Exception('expression is occur');
    }
  }

  Future addVehicle({data}) async {
    String url = BASE_URL + '/addVechile';
    //  print(data);
    final response = await Dio().post(
      url, data: (data),
      //   options: Options(contentType:("application/x-www-form-urlencoded"))
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    //final jsonResponse = jsonDecode(response.data);
    print(response);

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(url);
      return response.data;
    } else {
      throw Exception('expression is occur');
    }
  }

  //user/getVechile

  Future getVehicleInformation({nid}) async {
    String url = BASE_URL + '/getVechile/$nid';
    print(url);
    final response = await Dio().get(
      url,
      //   options: Options(contentType:("application/x-www-form-urlencoded"))
      // options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    //final jsonResponse = jsonDecode(response.data);
    print('samu');
    print(response.data);

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(url);
      return response.data;
    } else {
      throw Exception('expression is occur');
    }
  }
}
