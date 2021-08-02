import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkHelper extends ChangeNotifier {
  static const String BASE_URL = "http://10.0.2.2:3000/user";

  Future login({data}) async {
    String url = BASE_URL + '/signin';

    final response = await http.post(Uri.parse(url), body: data);
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse['data'];
    } else {
      print('expression is occur');
    }

    // print(response.body);
  }

  Future userProfile({nidValue}) async {
    String url = BASE_URL + '/userprofile/$nidValue';

    final response = await http.get(Uri.parse(url));
    print(url);
    final jsonResponse = jsonDecode(response.body);
   if (response.statusCode == 200) {
    //   print(jsonResponse);
    // UserProfile userInfo = new UserProfile.fromJson(jsonResponse);
    //   print(userInfo.status);
    //   return userInfo;
      return jsonResponse;
      notifyListeners();
     } else {
       print('expression is occur');
     }
    // return null;
  }
}
