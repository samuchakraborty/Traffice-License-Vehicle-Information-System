import 'package:flutter/material.dart';
import 'package:traffice_information_system/admin/screen/admin_drawer.dart';
import 'package:traffice_information_system/admin/services/admin_services.dart';

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
        body:Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Stolen Vehicle List", style: TextStyle(fontSize: 16),),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: FutureBuilder(
                  future: AdminRepository().getStolenInformation(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.separated(
                        itemCount: snapshot.data!['data'].length,
                        itemBuilder: (context, index) {
                          // print(snapshot.data!.license!.length);
                          return Card(
                            elevation: 4,

                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // physics: NeverScrollableScrollPhysics(),
                                // shrinkWrap: true,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Image.network(
                                      //   'http://10.0.2.2:3000/' +
                                      //       snapshot.data!['data']![index][]!,
                                      //   width: 120,
                                      //   height: 100,
                                      // ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          child: Text('Vechile Number: '),
                                        ),
                                        Container(
                                          child: Text(snapshot.data!['data']![index]['vehicle_no'].toString()),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Row(
                                  //   //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //   children: [
                                  //     Container(
                                  //       child: Text('License: '),
                                  //     ),
                                  //     Container(
                                  //       child: Text(snapshot.data!.license![index].lcNo!),
                                  //     ),
                                  //   ],
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          child: Text('Nid Number: '),
                                        ),
                                        Container(
                                          child: Text(snapshot.data!['data']![index]['n_id']
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Row(
                                  //   //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //   children: [
                                  //     Container(
                                  //       child: Text('Application Date: '),
                                  //     ),
                                  //     Container(
                                  //       child: Text(
                                  //         DateFormat().add_yMMMd().format(
                                  //           DateTime.parse(
                                  //             snapshot.data!.license![index]
                                  //                 .applicationDate
                                  //                 .toString(),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          child: Text('Address Of Stolen Area: '),
                                        ),
                                        Container(
                                          child: Text(
                                            snapshot.data!['data']![index]['address']!,

                                          ),
                                        ),
                                      ],


                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          child: Text('Status: '),
                                        ),
                                        Container(
                                          child: Text(
                                            snapshot.data!['data']![index]['status']!,
                                            //
                                            style: TextStyle(
                                                color: snapshot.data!['data']![index]
                                                ['status']! ==
                                                    'Not Found'
                                                    ? Colors.red
                                                    : Colors.green),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),



                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // if (snapshot.data!.license![index].lcStatus! !=
                                  //     'Active')
                                  //   Row(
                                  //     mainAxisAlignment: MainAxisAlignment.end,
                                  //     children: [
                                  //       GestureDetector(
                                  //         onTap: () {
                                  //           AdminRepository()
                                  //               .updateLicenseInformation(
                                  //               licenseNo: snapshot
                                  //                   .data!.license![index].lcNo)
                                  //               .then((value) {
                                  //             if (value == true) {
                                  //               Navigator.pop(context);
                                  //               Navigator.push(
                                  //                 context,
                                  //                 MaterialPageRoute(
                                  //                   builder: (context) => UserList(),
                                  //                 ),
                                  //               );
                                  //             }
                                  //           });
                                  //         },
                                  //         child: Container(
                                  //           child: Text(
                                  //             'Change Status  ',
                                  //             style: TextStyle(
                                  //                 color: Colors.orangeAccent,
                                  //                 fontSize: 16),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
        drawer: AdminDrawer(),
      ),
    );
  }
}
