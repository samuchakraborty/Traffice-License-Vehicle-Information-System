import 'package:flutter/material.dart';
import 'package:traffice_information_system/admin/screen/admin_drawer.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({Key? key}) : super(key: key);

  @override
  _AdminDashBoardState createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Admin DashBoard"),),
        body: Container(),
        drawer: AdminDrawer(),
      ),
    );
  }
}
