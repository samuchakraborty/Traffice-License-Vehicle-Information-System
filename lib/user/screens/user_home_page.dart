import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:traffice_information_system/user/services/user_services.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';
import 'package:traffice_information_system/widgets/user_drawer.dart';
import 'package:traffice_information_system/widgets/user_information.dart';

class UserHomePage extends StatefulWidget {
  final String nidValue;

  UserHomePage({required this.nidValue});

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

// final userFutureNotifier = FutureProvider<NetworkHelper>((_ref) {
//   return Future.value();
// });

class _UserHomePageState extends State<UserHomePage> {
  String? userName, userImage;
  int? userId;
  var license;

  @override
  void initState() {
    // TODO: implement initState
    NetworkHelper().userProfile(nidValue: widget.nidValue).then((value) {
      print("/////");
      print(value);
      setState(() {
        userName = value['userInfo']['u_name'];
        userImage = value['userInfo']['image'];
        userId = value['userInfo']['license'];
        license = value['license'];
      });
    });
    super.initState();
  }

  void call() {
    NetworkHelper().userProfile(nidValue: widget.nidValue).then((value) {
      print("/////");
      print(value);
      setState(() {
        userName = value['userInfo']['u_name'];
        userImage = value['userInfo']['image'];
        userId = value['userInfo']['license'];
        license = value['license'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // call();

    print(userId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Information'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            //  shrinkWrap: true,
            children: [
              Container(
                child: FutureBuilder(
                  future:
                      NetworkHelper().userProfile(nidValue: widget.nidValue),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                            userInfo(snapshot),

                            // Container(
                            //   margin: EdgeInsets.only(left: 10, right: 10),
                            //   padding: EdgeInsets.all(10),
                            //   child: Text('Present Address:  ' +
                            //       snapshot.data['userInfo']['p_address']),
                            // ),
                            Divider(
                              height: 6,
                            ),
                            if (snapshot.data['license'].isEmpty)
                              Container(
                                width: 120,
                                child: CustomButton(
                                    onPressed: () {},
                                    buttonName: 'Apply For Driving License'),
                              ),
                            if (snapshot.data['license'].isNotEmpty)
                              userLicense(snapshot),

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
              Column(
                children: [
                  Text(
                    "Vehicle Information",
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: NetworkHelper()
                        .getVehicleInformation(nid: widget.nidValue),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      if (snapshot.data == null) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        return Container(
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.network(
                                            'http://10.0.2.2:3000/' +
                                                snapshot.data['data'][index]
                                                    ['image'],
                                            width: 120,
                                            height: 100,
                                          ),
                                        ],
                                      ),
                                      UserInfo(
                                        isTrue: true,
                                        labelName: 'Vehicles Number: ',
                                        labelText: snapshot.data['data'][index]
                                                ['vehicles_no']
                                            .toString(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      UserInfo(
                                        isTrue: true,
                                        labelName: 'Fitness Report Number: ',
                                        labelText: snapshot.data['data'][index]
                                                ['fitness_report_number']
                                            .toString(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      UserInfo(
                                        isTrue: true,
                                        labelName: 'Insurance Number: ',
                                        labelText: snapshot.data['data'][index]
                                                ['insurnce_number']
                                            .toString(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      UserInfo(
                                        isTrue: true,
                                        labelName: 'Insurance Expired Date: ',
                                        labelText: snapshot.data['data'][index]
                                                ['insurance_date']
                                            .toString(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 2,
                                );
                              },
                              itemCount: snapshot.data['data'].length),
                        );
                      }

                      return Container();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: userName != null && userImage != null
            ? UserDrawer(
                license: license,
                userName: userName,
                image: userImage,
                nid: widget.nidValue,
                userId: userId.toString())
            : Container(),
      ),
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

  Card userInfo(AsyncSnapshot<dynamic> snapshot) {
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
                  labelName: 'User Name',
                  labelText: snapshot.data['userInfo']['u_name'],
                ),
                UserInfo(
                  isTrue: false,
                  labelName: 'Mobile',
                  labelText: snapshot.data['userInfo']['mobile'].toString(),
                ),
                // UserInfo(
                //   labelName: 'Present Address',
                //   labelText: snapshot.data['userInfo']
                //       ['p_address'],
                // ),
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
                      child: Text(snapshot.data['userInfo']['p_address'],
                          style: TextStyle(fontSize: 14, color: Colors.green)),
                    ),
                  ],
                )
              ],
            ),
            Image.network(
              'http://10.0.2.2:3000/' + snapshot.data['userInfo']['image'],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
