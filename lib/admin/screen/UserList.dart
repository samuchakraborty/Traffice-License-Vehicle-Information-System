import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:traffice_information_system/admin/models/user_model.dart';
import 'package:traffice_information_system/admin/services/admin_services.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        centerTitle: true,
      ),
      body: Container(
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
                  return Card(
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
                              child: Text(snapshot.data!.license![index].name!),
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
                              child: Text(snapshot.data!.license![index].lcNo!),
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
                              child: Text(snapshot.data!.license![index].lcType
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
                              child: Text('License Status: '),
                            ),
                            Container(
                              child: Text(
                                snapshot.data!.license![index].lcStatus!,
                                style: TextStyle(
                                    color: snapshot.data!.license![index]
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
                                          licenseNo: snapshot
                                              .data!.license![index].lcNo)
                                      .then((value) {
                                    if (value == true) {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UserList(),
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
    );
  }
}
