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

  @override
  void initState() {
    // TODO: implement initState
    NetworkHelper().userProfile(nidValue: widget.nidValue).then((value) {
      print("/////");
      print(value);
      setState(() {
        userName = value['userInfo']['u_name'];
        userImage = value['userInfo']['image'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Information'),
          centerTitle: true,
        ),
        body: Container(
          child: FutureBuilder(
            future: NetworkHelper().userProfile(nidValue: widget.nidValue),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return Card(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UserInfo(
                                  labelName: 'User Name',
                                  labelText: snapshot.data['userInfo']
                                      ['u_name'],
                                ),
                                UserInfo(
                                  labelName: 'Mobile',
                                  labelText: snapshot.data['userInfo']['mobile']
                                      .toString(),
                                ),
                                // UserInfo(
                                //   labelName: 'Present Address',
                                //   labelText: snapshot.data['userInfo']
                                //       ['p_address'],
                                // ),
                              ],
                            ),
                            Image.network(
                              'http://10.0.2.2:3000/' +
                                  snapshot.data['userInfo']['image'],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        child: Text('Present Address:  ' +
                            snapshot.data['userInfo']['p_address']),
                      ),
                      Divider(
                        height: 6,
                      ),
                      if (snapshot.data['license'].isEmpty)
                        CustomButton(
                            onPressed: () {},
                            buttonName: 'Apply For Driving License'),
                      if (snapshot.data['license'].isNotEmpty)
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                "License Information",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blueAccent),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              UserInfo(
                                labelName: 'License Number',
                                labelText: snapshot.data['license'][0]['lc_no'],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              UserInfo(
                                labelName: 'License Type',
                                labelText: snapshot.data['license'][0]
                                    ['lc_type'],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              UserInfo(
                                labelName: 'License Status',
                                labelText: snapshot.data['license'][0]
                                    ['lc_status'],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              UserInfo(
                                labelName: 'Exam Issue Date',
                                labelText: DateFormat().add_yMMMd().format(
                                      DateTime.parse(snapshot.data['license'][0]
                                          ['exam_date']),
                                    ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              UserInfo(
                                labelName: 'License Issue Date',
                                labelText: DateFormat().add_yMMMd().format(
                                      DateTime.parse(snapshot.data['license'][0]
                                          ['lc_issue_date']),
                                    ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              UserInfo(
                                labelName: 'License Expired Date',
                                labelText: DateFormat().add_yMMMd().format(
                                      DateTime.parse(snapshot.data['license'][0]
                                          ['lc_expired_date']),
                                    ),
                              ),
                            ],
                          ),
                        ),

                      // Text(DateTime.parse(snapshot.data['userInfo']['dob'].toString())),

                      Divider(
                        height: 6,
                      ),
                      if (snapshot.data['license'].isNotEmpty)
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                "Vehicle Information",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blueAccent),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              UserInfo(
                                labelName: 'Owner Name',
                                labelText: snapshot.data['userInfo']['u_name'],
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // UserInfo(
                              //   labelName: 'License Type',
                              //   labelText: snapshot.data['license'][0]
                              //   ['lc_type'],
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              // UserInfo(
                              //   labelName: 'License Status',
                              //   labelText: snapshot.data['license'][0]
                              //   ['lc_status'],
                              // ),

                              SizedBox(
                                height: 10,
                              ),
                              if (snapshot.data['license'].isNotEmpty)
                                UserInfo(
                                  labelName: 'Insurance Expired Date',
                                  labelText: DateFormat().add_yMMMd().format(
                                        DateTime.parse(snapshot.data['license']
                                            [0]['exam_date']),
                                      ),
                                ),

                              SizedBox(
                                height: 10,
                              ),

                              UserInfo(
                                labelName: 'License Issue Date',
                                labelText: DateFormat().add_yMMMd().format(
                                      DateTime.parse(snapshot.data['license'][0]
                                          ['lc_issue_date']),
                                    ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              UserInfo(
                                labelName: 'License Expired Date',
                                labelText: DateFormat().add_yMMMd().format(
                                      DateTime.parse(snapshot.data['license'][0]
                                          ['lc_expired_date']),
                                    ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),
        ),
        drawer: userName != null && userImage != null
            ? UserDrawer(
                userName: userName,
                image: userImage,
              )
            : Container(),
      ),
    );
  }
}
