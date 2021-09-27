import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traffice_information_system/police/screens/verify_license.dart';
import 'package:traffice_information_system/police/screens/verify_vehicle.dart';
import 'package:traffice_information_system/user_police_admin.dart';
import '../../constants.dart';

class PoliceDrawer extends StatelessWidget {
  final String? userName, image, designation;

  PoliceDrawer({
    this.userName,
    this.image,
    this.designation
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 280,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        //   backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          'http://10.0.2.2:3000/' + image!,
                          // fit: BoxFit.contain,
                        ),
                        // child: Container(   width: 100,),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(userName!, style: emailTextStyle),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        designation!,
                        style: emailTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //  if(license.isEmpty)
          CustomDrawerItem(
            isOptional: false,
            icon: CupertinoIcons.person_alt,
            labelText: 'Verify License',
            route: () {
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
            icon: CupertinoIcons.person_alt,
            labelText: 'Verify Vehicle',
            route: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VerifyVehicle()));
            },
            iconsOptional: Icons.arrow_forward_ios_sharp,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // CustomDrawerItem(
          //   isOptional: false,
          //   icon: CupertinoIcons.flag,
          //   labelText: 'Add Your Vehicle Information',
          //   iconsOptional: Icons.arrow_forward_ios_sharp,
          //   route: () {
          //
          //   },
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // CustomDrawerItem(
          //   isOptional: false,
          //   icon: CupertinoIcons.square_favorites_fill,
          //   labelText: 'Pay Bill',
          //   iconsOptional: Icons.arrow_forward_ios_sharp,
          //   route: () {
          //
          //   },
          // ),
          SizedBox(
            height: 10,
          ),
          // CustomDrawerItem(
          //   isOptional: false,
          //   icon: CupertinoIcons.mail,
          //   labelText: 'Report',
          //   iconsOptional: Icons.arrow_forward_ios_sharp,
          // ),
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserOrPoliceOrAdmin(),
                        ),
                      );
                    },
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
