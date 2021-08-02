import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traffice_information_system/user/services/user_services.dart';
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
      userName = value['userInfo']['u_name'];
      userImage = value['userInfo']['image'];


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
        drawer: UserDrawer(
          userName: userName,
          image: userImage,

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
                  child: Column(
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
                                UserInfo(
                                  labelName: 'User Name: ',
                                  labelText: snapshot.data['userInfo']
                                      ['u_name'],
                                ),
                              ],
                            ),
                            Image.network(
                              'http://10.0.2.2:3000/' +
                                  snapshot.data['userInfo']['image'],
                              width: 120,
                              height: 120,
                            )
                          ],
                        ),
                      ),

                      Text(snapshot.data['userInfo']['mobile'].toString()),
                      Text(snapshot.data['userInfo']['p_address']),
                      // Text(DateTime.parse(snapshot.data['userInfo']['dob'].toString())),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
