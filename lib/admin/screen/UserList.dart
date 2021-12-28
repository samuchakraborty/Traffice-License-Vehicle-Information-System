import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:traffice_information_system/admin/models/user_model.dart';
import 'package:traffice_information_system/admin/screen/send_exam_date.dart';
import 'package:traffice_information_system/admin/services/admin_services.dart';
import 'package:traffice_information_system/police/provider/vehicle_provider.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final TextEditingController? vehicleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        centerTitle: true,
      ),
      body: Column(
        //shrinkWrap: true,
        children: [
          Consumer(builder: (context, watch, child) {
            final data = watch(getLicenseProvider);
            return Container(
              height:data.searchResults != null &&
                  vehicleController!.text.length != 0
                  ? 360
                  : 160,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Please Enter License Number "),
                      controller: vehicleController,
                      onChanged: (value) {
                        // searchQuery = value;
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read(getLicenseProvider)
                          .placeSearch(searchValue: vehicleController!.text);
                      // vehicleController!.clear();
                      // searchQuery = '';
                    },
                    child: Text("Submit"),
                  ),
                  //if (searchQuery.isNotEmpty)

                  if (data.searchResults != null &&
                      vehicleController!.text.length != 0)
                    Column(
                      children: [
                        Center(
                            child: Text(
                          data.searchResults!.msg.toString(),
                          style: TextStyle(
                              color: data.searchResults!.msg.toString() ==
                                      'License not found'
                                  ? Colors.red
                                  : Colors.green,
                              fontSize: 18),
                        )),
                      ],
                    ),

                  SizedBox(
                    height: 10,
                  ),
                  if (data.searchResults != null &&
                      data.searchResults!.licenseInformation!.isNotEmpty &&
                      vehicleController!.text != '')
                    Card(
                      elevation: 4,
                      margin: EdgeInsets.only(bottom: 10),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "License Number: ",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  data.searchResults!.licenseInformation![0]
                                      .lcNo
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.red)),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Name: ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          data.searchResults!
                                              .licenseInformation![0].name
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mobile: ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          data.searchResults!
                                              .userInformation![0].mobile
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('National Id Card No: '),
                                        Text(
                                          data.searchResults!
                                              .userInformation![0].nId
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Image.network(
                                  'http://10.0.2.2:3000/' +
                                      data.searchResults!.licenseInformation![0]
                                          .image
                                          .toString(),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("Application Date: "),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                DateFormat().add_yMMMd().format(
                                      DateTime.parse(data
                                          .searchResults!
                                          .licenseInformation![0]
                                          .applicationDate
                                          .toString()),
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              if (data.searchResults!.licenseInformation![0]
                                      .lcExpiredDate !=
                                  null)
                                Text("Expire Date: "),
                              SizedBox(
                                width: 10,
                              ),
                              if (data.searchResults!.licenseInformation![0]
                                      .lcExpiredDate !=
                                  null)
                                Text(
                                  DateFormat().add_yMMMd().format(
                                        DateTime.parse(data
                                            .searchResults!
                                            .licenseInformation![0]
                                            .lcExpiredDate
                                            .toString()),
                                      ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            );
          }),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: FutureBuilder<User>(
                future: AdminRepository().getUserInformation(),
                builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                  print(snapshot.data);
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data!.license!.length,
                      itemBuilder: (context, index) {
                        print(snapshot.data!.license!.length);
                        return GestureDetector(
                          onTap: () {
                            if (snapshot.data!.license![index].examDate ==
                                null) {
                              print(snapshot.data!.license![index].name);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SentExamDate(
                                    label: snapshot.data!.license![index].name
                                        .toString(),
                                  ),
                                ),
                              );
                              print('nnn');
                            }
                          },
                          child: Card(
                            elevation: 4,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              // physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.network(
                                      'http://10.0.2.2:3000/' +
                                          snapshot.data!.license![index].image!,
                                      width: 120,
                                      height: 100,
                                    ),
                                  ],
                                ),
                                Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text('User Name: '),
                                    ),
                                    Container(
                                      child: Text(
                                          snapshot.data!.license![index].name!),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text('License: '),
                                    ),
                                    Container(
                                      child: Text(
                                          snapshot.data!.license![index].lcNo!),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text('License Type: '),
                                    ),
                                    Container(
                                      child: Text(snapshot
                                          .data!.license![index].lcType
                                          .toString()),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text('Application Date: '),
                                    ),
                                    Container(
                                      child: Text(
                                        DateFormat().add_yMMMd().format(
                                              DateTime.parse(
                                                snapshot.data!.license![index]
                                                    .applicationDate
                                                    .toString(),
                                              ),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text('Exam Date: '),
                                    ),
                                    Container(
                                      child: Text(
                                        snapshot.data!.license![index]
                                                    .examDate !=
                                                null
                                            ? DateFormat().add_yMMMd().format(
                                                  DateTime.parse(
                                                    snapshot
                                                        .data!
                                                        .license![index]
                                                        .examDate
                                                        .toString(),
                                                  ),
                                                )
                                            : 'Not Yet',
                                        style: TextStyle(
                                            color: snapshot
                                                        .data!
                                                        .license![index]
                                                        .examDate !=
                                                    null
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text('License Status: '),
                                    ),
                                    Container(
                                      child: Text(
                                        snapshot
                                            .data!.license![index].lcStatus!,
                                        style: TextStyle(
                                            color: snapshot
                                                        .data!
                                                        .license![index]
                                                        .lcStatus! ==
                                                    'Active'
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                if (snapshot.data!.license![index].lcStatus! !=
                                    'Active')
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          AdminRepository()
                                              .updateLicenseInformation(
                                                  licenseNo: snapshot.data!
                                                      .license![index].lcNo)
                                              .then((value) {
                                            if (value == true) {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserList(),
                                                ),
                                              );
                                            }
                                          });
                                        },
                                        child: Container(
                                          child: Text(
                                            'Change Status  ',
                                            style: TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                SizedBox(
                                  height: 20,
                                ),
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
    );
  }
}
