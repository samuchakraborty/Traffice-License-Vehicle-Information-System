import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traffice_information_system/auth/sign_in.dart';
import 'package:traffice_information_system/widgets/check_type_of_user.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';

import 'constants.dart';

class UserOrPoliceOrAdmin extends StatefulWidget {
  @override
  _UserOrPoliceOrAdminState createState() => _UserOrPoliceOrAdminState();
}

enum PROFILE { USER, POLICE, ADMIN }
enum LANGUAGE { ENGLISH, BANGLA }

class _UserOrPoliceOrAdminState extends State<UserOrPoliceOrAdmin> {
  PROFILE? selectedProfile;
  LANGUAGE _selectedLang = LANGUAGE.BANGLA;

  int val = 1;

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    setInitialLanguage();
    super.initState();
  }

  setInitialLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('locale') == 'bn_BD') {
      setState(() {
        _selectedLang = LANGUAGE.BANGLA;
      });
    }
    if (prefs.getString('locale') == 'en_US') {
      setState(() {
        _selectedLang = LANGUAGE.ENGLISH;
      });
    }
  }

  final locals = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'বাংলা', 'locale': Locale('bn', 'BD')},
  ];

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var locale = prefs.getString('locale');
    print(locale);
    Locale? locals = Locale('bn_BD');
    if (locale == null || locale.isEmpty) {
      locals = Locale('bn', 'BD');
    } else {
      var splitedLocal = locale.split('_').toList();
      locals = Locale(splitedLocal[0], splitedLocal[1]);
    }
    Get.updateLocale(locals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Column(
      //     children: [
      //       RadioListTile(
      //         title: Text('বাংলা'),
      //         value: LANGUAGE.BANGLA,
      //         groupValue: _selectedLang,
      //         onChanged: (LANGUAGE? value) async {
      //           setState(() {
      //             _selectedLang = value!;
      //           });
      //           SharedPreferences prefs = await SharedPreferences.getInstance();
      //           if (prefs.getString('locale') == 'bn_BD') {
      //             var snackBar = SnackBar(
      //                 content: Text('আপনার ভাষা ইতিমধ্যে পরিবর্তন করা হয়েছে'));
      //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //           } else {
      //             Get.updateLocale(locals[1]['locale'] as Locale);
      //             //Save Locale state in Shared Preference
      //             prefs.setString('locale', locals[1]['locale'].toString());
      //             print(prefs.getString('locale'));
      //             var snackBar =
      //             SnackBar(content: Text('আপনার ভাষা পরিবর্তন করা হয়েছে'));
      //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //           }
      //         },
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       RadioListTile(
      //         title: Text('English'),
      //         value: LANGUAGE.ENGLISH,
      //         groupValue: _selectedLang,
      //         onChanged: (LANGUAGE? value) async {
      //           setState(() {
      //             _selectedLang = value!;
      //           });
      //           SharedPreferences prefs = await SharedPreferences.getInstance();
      //           if (prefs.getString('locale') != 'en_US') {
      //             Get.updateLocale(locals[0]['locale'] as Locale);
      //             //Save Locale state in Shared Preference
      //             prefs.setString('locale', locals[0]['locale'].toString());
      //
      //             print(prefs.getString('locale'));
      //             var snackBar =
      //             SnackBar(content: Text('Language changed successfullyy'));
      //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //           } else {
      //             print(prefs.getString('locale'));
      //             var snackBar = SnackBar(
      //                 content: Text('Your language has already been changed!'));
      //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //           }
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 40, right: 30),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text('বাংলা'),
                    value: LANGUAGE.BANGLA,
                    groupValue: _selectedLang,
                    onChanged: (LANGUAGE? value) async {
                      setState(() {
                        _selectedLang = value!;
                      });
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      if (prefs.getString('locale') == 'bn_BD') {
                        var snackBar = SnackBar(
                            content: Text('আপনার ভাষা ইতিমধ্যে পরিবর্তন করা হয়েছে'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        Get.updateLocale(locals[1]['locale'] as Locale);
                        //Save Locale state in Shared Preference
                        prefs.setString('locale', locals[1]['locale'].toString());
                        print(prefs.getString('locale'));
                        var snackBar =
                        SnackBar(content: Text('আপনার ভাষা পরিবর্তন করা হয়েছে'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text('English'),
                    value: LANGUAGE.ENGLISH,
                    groupValue: _selectedLang,
                    onChanged: (LANGUAGE? value) async {
                      setState(() {
                        _selectedLang = value!;
                      });
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      if (prefs.getString('locale') != 'en_US') {
                        Get.updateLocale(locals[0]['locale'] as Locale);
                        //Save Locale state in Shared Preference
                        prefs.setString('locale', locals[0]['locale'].toString());

                        print(prefs.getString('locale'));
                        var snackBar =
                        SnackBar(content: Text('Language changed successfullyy'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        print(prefs.getString('locale'));
                        var snackBar = SnackBar(
                            content: Text('Your language has already been changed!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ),
              ],
            ),



            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(right: 100,top: 100),
              child: Center(
                child: Text(
                  "ACCOUNT_TYPE_SELECTION".tr,
                  style: h1TextStyle,
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProfile = PROFILE.USER;
                    });
                  },
                  child: CustomSellerBuyer(
                    containerHeight: 200,
                    containerWidth: MediaQuery.of(context).size.width / 4.2,
                    textColor: selectedProfile == PROFILE.USER
                        ? Colors.white
                        : Colors.black,
                    borderColor: Colors.grey,
                    icon: Icons.person_outline_outlined,
                    backgroundColor: selectedProfile == PROFILE.USER
                        ? Colors.green
                        : Colors.white,
                    textName: 'USER'.tr,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProfile = PROFILE.POLICE;
                    });
                  },
                  child: CustomSellerBuyer(
                    containerHeight: 200,
                    containerWidth: MediaQuery.of(context).size.width / 4.2,
                    textColor: selectedProfile == PROFILE.POLICE
                        ? Colors.white
                        : Colors.black,
                    borderColor: Colors.grey,
                    icon: Icons.local_police_outlined,
                    backgroundColor: selectedProfile == PROFILE.POLICE
                        ? Colors.green
                        : Colors.white,
                    textName: 'POLICE'.tr,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProfile = PROFILE.ADMIN;
                    });
                  },
                  child: CustomSellerBuyer(
                    containerHeight: 200,
                    containerWidth: MediaQuery.of(context).size.width / 4.2,
                    textColor: selectedProfile == PROFILE.ADMIN
                        ? Colors.white
                        : Colors.black,
                    borderColor: Colors.grey,
                    icon: Icons.admin_panel_settings_outlined,
                    backgroundColor: selectedProfile == PROFILE.ADMIN
                        ? Colors.green
                        : Colors.white,
                    textName: 'ADMIN'.tr,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            CustomButton(
              buttonName: 'CONTINUE'.tr,
              onPressed: () {
                switch (selectedProfile!) {
                  case PROFILE.USER:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(
                          isAdmin: false,
                          isPolice: false,
                          isUser: true,
                        ),
                      ),
                    );
                    break;
                  case PROFILE.POLICE:
                    print('hello police');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(
                          isAdmin: false,
                          isPolice: true,
                          isUser: false,
                        ),
                      ),
                    );
                    break;

                  case PROFILE.ADMIN:
                    print('hello admin');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(
                          isAdmin: true,
                          isPolice: false,
                          isUser: false,
                        ),
                      ),
                    );
                    break;
                }

                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => SignUp()));
              },
            )
          ],
        ),
      ),
    );
  }
}
