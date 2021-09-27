import 'package:flutter/material.dart';
import 'package:traffice_information_system/admin/models/user_model.dart';
import 'package:traffice_information_system/admin/models/vehicle_model.dart';
import 'package:traffice_information_system/admin/services/admin_services.dart';

class VehicleList extends StatefulWidget {
  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle List"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder<Vechile>(
          future: AdminRepository().getVehicleInformation(),
          builder: (BuildContext context, AsyncSnapshot<Vechile> snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.vehicles!.length,
                  itemBuilder: (context, index) {
                    //print(snapshot.data!.license!.length);
                    return Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // physics: NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        children: [
                          Text(index.toString(), style: TextStyle(fontSize: 18, color: Colors.green),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.network(
                                'http://10.0.2.2:3000/' +
                                    snapshot.data!.vehicles![index].image!,
                                width: 120,
                                height: 100,
                              ),
                            ],
                          ),
                          Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text('Vehicle Number: '),
                              ),
                              Container(
                                child: Text(snapshot
                                    .data!.vehicles![index].vehiclesNo!),
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
                                child: Text('Insurance number: '),
                              ),
                              Container(
                                child: Text(snapshot
                                    .data!.vehicles![index].insurnceNumber!
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
                                child: Text('Fitness Number: '),
                              ),
                              Container(
                                child: Text(
                                  snapshot.data!.vehicles![index]
                                      .fitnessReportNumber!
                                      .toString(),
                                  style: TextStyle(color: Colors.red),
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
                                child: Text('Type Of Vehicle: '),
                              ),
                              Container(
                                child: Text(
                                  snapshot.data!.vehicles![index].type!
                                      .toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
