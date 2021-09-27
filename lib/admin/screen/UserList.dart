import 'package:flutter/material.dart';
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
        child: FutureBuilder<User>(
          future: AdminRepository().getUserInformation(),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.license!.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data!.license!.length);
                    return Card(
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
                                child:
                                    Text(snapshot.data!.license![index].name!),
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
                                child:
                                    Text(snapshot.data!.license![index].lcNo!),
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
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),


                          SizedBox(height: 20,),
                        ],
                      ),
                    );
                  });
            }

            return Container();
          },
        ),
      ),
    );
  }
}