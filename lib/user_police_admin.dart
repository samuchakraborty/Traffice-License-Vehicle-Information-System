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

class _UserOrPoliceOrAdminState extends State<UserOrPoliceOrAdmin> {
  PROFILE? selectedProfile;

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

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
      body: Container(
        margin: EdgeInsets.only(top: 140, left: 40, right: 30),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(right: 100),
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
                        ? Colors.indigoAccent
                        : Colors.white,
                    textName: 'User',
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
                        ? Colors.indigoAccent
                        : Colors.white,
                    textName: 'Police',
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
                        ? Colors.indigoAccent
                        : Colors.white,
                    textName: 'Admin',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            CustomButton(
              buttonName: 'Continue',
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
