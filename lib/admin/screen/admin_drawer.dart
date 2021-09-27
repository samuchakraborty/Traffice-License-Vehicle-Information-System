import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traffice_information_system/admin/screen/vehicle_list.dart';
import 'package:traffice_information_system/police/screens/verify_license.dart';
import 'package:traffice_information_system/police/screens/verify_vehicle.dart';
import 'package:traffice_information_system/user/screens/add_vehilec_info.dart';
import 'package:traffice_information_system/user/screens/apply_for_licence.dart';
import 'package:traffice_information_system/user/screens/quiz/quizbrain.dart';
import 'package:traffice_information_system/user/screens/ssl_comerz.dart';

import 'UserList.dart';
import 'add_vechile_by_admin.dart';

class AdminDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            child: DrawerHeader(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(CupertinoIcons.clear),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          CustomDrawerItem(
            isOptional: false,
            icon: CupertinoIcons.person_alt,
            labelText: 'Check User List',
            route: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => UserList(),
                ),
              );
            },
            iconsOptional: Icons.arrow_forward_ios_sharp,
          ),
          SizedBox(
            height: 10,
          ),
          //  if(license.isEmpty)
          CustomDrawerItem(
            isOptional: false,
            icon: CupertinoIcons.person_alt,
            labelText: 'Check User License',
            route: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) => ApplyForLicence(
              //         userName: userName!,
              //         userImage: image!,
              //         nid: nid!,
              //         userId: userId),
              //   ),
              // );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VerifyLicense()));
            },
            iconsOptional: Icons.arrow_forward_ios_sharp,
          ),

          SizedBox(
            height: 10,
          ),
          CustomDrawerItem(
            isOptional: false,
            icon: CupertinoIcons.flag,
            labelText: 'Add Vehicle Information',
            iconsOptional: Icons.arrow_forward_ios_sharp,
            route: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddVehicleByAdmin(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),


          CustomDrawerItem(
            isOptional: false,
            icon: CupertinoIcons.flag,
            labelText: 'All Vehicle Information',
            iconsOptional: Icons.arrow_forward_ios_sharp,
            route: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => VehicleList(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomDrawerItem(
            isOptional: false,
            icon: CupertinoIcons.flag,
            labelText: 'Check Vehicle Information',
            iconsOptional: Icons.arrow_forward_ios_sharp,
            route: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VerifyVehicle()));
            },
          ),
          SizedBox(
            height: 10,
          ),
          // CustomDrawerItem(
          //   isOptional: false,
          //   icon: CupertinoIcons.square_favorites_fill,
          //   labelText: 'Pay Bill',
          //   iconsOptional: Icons.arrow_forward_ios_sharp,
          //   route: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (_) => SSL(),
          //       ),
          //     );
          //   },
          // ),
          SizedBox(
            height: 10,
          ),
          CustomDrawerItem(
            isOptional: false,
            icon: CupertinoIcons.mail,
            labelText: 'Check Report',
            iconsOptional: Icons.arrow_forward_ios_sharp,
          ),
          SizedBox(
            height: 10,
          ),
          // CustomDrawerItem(
          //   isOptional: false,
          //   icon: CupertinoIcons.settings,
          //   labelText: 'Settings',
          // ),
          Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 40),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  CustomDrawerItem(
      {required this.labelText,
      required this.isOptional,
      this.route,
      required this.icon,
      this.iconsOptional});

  final IconData icon;
  final String labelText;
  final IconData? iconsOptional;
  final bool isOptional;
  final Function()? route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: route,
      child: Container(
        margin:
            isOptional == false ? EdgeInsets.only(left: 12) : EdgeInsets.all(0),
        padding: isOptional == false ? EdgeInsets.all(10) : EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: 10,
            ),
            Text(
              labelText,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(iconsOptional),
              ),
            ),
            // SizedBox(
            //   width: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
