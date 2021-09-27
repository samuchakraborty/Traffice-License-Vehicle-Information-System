import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:traffice_information_system/police/models/police_model.dart';
import 'package:traffice_information_system/police/screens/police_drawer.dart';
import 'package:traffice_information_system/police/services/police_services.dart';
import 'package:traffice_information_system/user/services/user_services.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';
import 'package:traffice_information_system/widgets/user_drawer.dart';
import 'package:traffice_information_system/widgets/user_information.dart';

class PoliceHomePage extends StatefulWidget {
  final String batchId;

  PoliceHomePage({required this.batchId});

  @override
  _PoliceHomePageState createState() => _PoliceHomePageState();
}

class _PoliceHomePageState extends State<PoliceHomePage> {
  String? userName, userImage;
  int? userId;
  var license;

  @override
  void initState() {
    // TODO: implement initState
    PoliceRepository().getPoliceProfile(batchId: widget.batchId).then((value) {
      print("/////");
      print(value);
      setState(() {
        userName = value.policeInfo!.name;
        userImage = value.policeInformation!.image;
        // userId = val;
        // license = value['license'];
      });
    });
    super.initState();
  }

  // void call() {
  //   NetworkHelper().userProfile(nidValue: widget.nidValue).then((value) {
  //     print("/////");
  //     print(value);
  //     setState(() {
  //       userName = value['userInfo']['u_name'];
  //       userImage = value['userInfo']['image'];
  //       userId = value['userInfo']['license'];
  //       license = value['license'];
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // call();

    print(userId);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('DashBoard'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              //  shrinkWrap: true,
              children: [
                Container(
                  child: FutureBuilder<PoliceInfo>(
                    future: PoliceRepository()
                        .getPoliceProfile(batchId: widget.batchId),
                    builder: (BuildContext context,
                        AsyncSnapshot<PoliceInfo> snapshot) {
                      print(snapshot.data);
                      if (snapshot.data == null) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return Card(
                          child: Column(
                            // physics: NeverScrollableScrollPhysics(),
                            // shrinkWrap: true,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              policeInfo(snapshot),

                              Divider(
                                height: 6,
                              ),
                              // if (snapshot.data['license'].isEmpty)
                              // Container(
                              //   //  width: 300,
                              //   child: CustomButton(
                              //       onPressed: () {},
                              //       buttonName: 'Apply For Driving License'),
                              // ),
                              //  if (snapshot.data['license'].isNotEmpty)
                              //  userLicense(snapshot),

                              // Text(DateTime.parse(snapshot.data['userInfo']['dob'].toString())),

                              Divider(
                                height: 6,
                              ),
                              //if (snapshot.data['license'].isNotEmpty)
                              // userVehicle(snapshot),
                            ],
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Column(
                //   children: [
                //     Text(
                //       "Vehicle Information",
                //       style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     FutureBuilder(
                //       future: NetworkHelper()
                //           .getVehicleInformation(nid: widget.nidValue),
                //       builder: (BuildContext context, AsyncSnapshot snapshot) {
                //         print(snapshot.data);
                //         if (snapshot.data == null) {
                //           return Center(
                //             child: CircularProgressIndicator(),
                //           );
                //         } else if (snapshot.hasData) {
                //           return Container(
                //             child: ListView.separated(
                //                 shrinkWrap: true,
                //                 physics: NeverScrollableScrollPhysics(),
                //                 itemBuilder: (context, index) {
                //                   return Card(
                //                     child: Column(
                //                       children: [
                //                         Row(
                //                           mainAxisAlignment:
                //                           MainAxisAlignment.end,
                //                           children: [
                //                             Image.network(
                //                               'http://10.0.2.2:3000/' +
                //                                   snapshot.data['data'][index]
                //                                   ['image'],
                //                               width: 120,
                //                               height: 100,
                //                             ),
                //                           ],
                //                         ),
                //                         UserInfo(
                //                           isTrue: true,
                //                           labelName: 'Vehicles Number: ',
                //                           labelText: snapshot.data['data'][index]
                //                           ['vehicles_no']
                //                               .toString(),
                //                         ),
                //                         SizedBox(
                //                           height: 10,
                //                         ),
                //                         UserInfo(
                //                           isTrue: true,
                //                           labelName: 'Fitness Report Number: ',
                //                           labelText: snapshot.data['data'][index]
                //                           ['fitness_report_number']
                //                               .toString(),
                //                         ),
                //                         SizedBox(
                //                           height: 10,
                //                         ),
                //                         UserInfo(
                //                           isTrue: true,
                //                           labelName: 'Insurance Number: ',
                //                           labelText: snapshot.data['data'][index]
                //                           ['insurnce_number']
                //                               .toString(),
                //                         ),
                //                         SizedBox(
                //                           height: 10,
                //                         ),
                //                         UserInfo(
                //                           isTrue: true,
                //                           labelName: 'Insurance Expired Date: ',
                //                           labelText: snapshot.data['data'][index]
                //                           ['insurance_date']
                //                               .toString(),
                //                         ),
                //                         SizedBox(
                //                           height: 10,
                //                         ),
                //                       ],
                //                     ),
                //                   );
                //                 },
                //                 separatorBuilder: (context, index) {
                //                   return Divider(
                //                     height: 2,
                //                   );
                //                 },
                //                 itemCount: snapshot.data['data'].length),
                //           );
                //         }
                //
                //         return Container();
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          drawer: userName != null && userImage != null
              ? PoliceDrawer(
                  image: userImage,
                  userName: userName,
                )
              : Container()),
    );
  }

  Card userLicense(AsyncSnapshot<dynamic> snapshot) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "License Information",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  'http://10.0.2.2:3000/' +
                      snapshot.data['license'][0]['image'],
                  height: 100,
                  width: 100,
                )
              ],
            ),
            UserInfo(
              isTrue: true,
              labelName: 'License Number',
              labelText: snapshot.data['license'][0]['lc_no'],
            ),
            SizedBox(
              height: 10,
            ),
            UserInfo(
              isTrue: false,
              labelName: 'License Type',
              labelText: snapshot.data['license'][0]['lc_type'],
            ),
            SizedBox(
              height: 10,
            ),
            UserInfo(
              isTrue: true,
              labelName: 'License Status',
              labelText: snapshot.data['license'][0]['lc_status'],
            ),
            SizedBox(
              height: 10,
            ),
            UserInfo(
              isTrue: true,
              labelName: 'License Application Date',
              labelText: DateFormat().add_yMMMd().format(
                    DateTime.parse(
                        snapshot.data['license'][0]['application_date']),
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            if (snapshot.data['license'][0]['exam_date'] != null)
              UserInfo(
                isTrue: true,
                labelName: 'Exam Issue Date',
                labelText: DateFormat().add_yMMMd().format(
                      DateTime.parse(snapshot.data['license'][0]['exam_date']),
                    ),
              ),
            SizedBox(
              height: 10,
            ),
            if (snapshot.data['license'][0]['lc_issue_date'] != null)
              UserInfo(
                isTrue: true,
                labelName: 'License Issue Date',
                labelText: DateFormat().add_yMMMd().format(
                      DateTime.parse(
                          snapshot.data['license'][0]['lc_issue_date']),
                    ),
              ),
            SizedBox(
              height: 10,
            ),
            if (snapshot.data['license'][0]['lc_expired_date'] != null)
              UserInfo(
                isTrue: true,
                labelName: 'License Expired Date',
                labelText: DateFormat().add_yMMMd().format(
                      DateTime.parse(
                          snapshot.data['license'][0]['lc_expired_date']),
                    ),
              ),
          ],
        ),
      ),
    );
  }

  Card policeInfo(AsyncSnapshot<PoliceInfo> snapshot) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfo(
                  isTrue: false,
                  labelName: 'Name',
                  labelText:
                      snapshot.data!.policeInformation!.firstName.toString() +
                          " " +
                          snapshot.data!.policeInformation!.lastName.toString(),
                ),
                UserInfo(
                  isTrue: false,
                  labelName: 'Batch Id',
                  labelText: snapshot.data!.policeInfo!.id.toString(),
                ),
                UserInfo(
                  labelName: 'Position',
                  labelText: snapshot.data!.policeInfo!.position,
                  isTrue: false,
                ),
                UserInfo(
                  labelName: 'District',
                  labelText: snapshot.data!.policeInfo!.district,
                  isTrue: false,
                ),
                UserInfo(
                  labelName: 'Thana',
                  labelText: snapshot.data!.policeInfo!.thana,
                  isTrue: false,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(left: 10, right: 10),
                      // padding: EdgeInsets.all(10),
                      child: Text(
                        'Present Address: ',
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 10, right: 10),
                      // padding: EdgeInsets.all(10),
                      child: Text(snapshot.data!.policeInformation!.pAddress!,
                          style: TextStyle(fontSize: 14, color: Colors.green)),
                    ),
                  ],
                )
              ],
            ),
            Image.network(
              'http://10.0.2.2:3000/' +
                  snapshot.data!.policeInformation!.image!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}


