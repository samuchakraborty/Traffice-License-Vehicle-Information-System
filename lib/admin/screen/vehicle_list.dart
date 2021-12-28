import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traffice_information_system/admin/models/user_model.dart';
import 'package:traffice_information_system/admin/models/vehicle_model.dart';
import 'package:traffice_information_system/admin/services/admin_services.dart';
import 'package:traffice_information_system/police/provider/vehicle_provider.dart';

class VehicleList extends StatefulWidget {
  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  final TextEditingController? vehicleController = TextEditingController();
  late String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle List"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer(builder: (context, watch, child) {
            final data = watch(getVehicleProvider);

            return Container(
              height: data.searchResults != null &&
                      vehicleController!.text.length != 0
                  ? 360
                  : 160,
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Please Enter Vehicle Number "),
                      controller: vehicleController,
                      onChanged: (value) {
                        searchQuery = value;
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read(getVehicleProvider)
                          .placeSearch(searchValue: vehicleController!.text);
                      // vehicleController!.clear();
                      // searchQuery = '';
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                  ),
                  //if (searchQuery.isNotEmpty)
                  SizedBox(
                    height: 10,
                  ),
                  //  if (data.searchResults != null && vehicleController!.text.length != 0)
                  if (data.searchResults != null &&
                      vehicleController!.text != '')
                    Center(
                      child: Text(
                        data.searchResults!.msg.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.redAccent),
                      ),
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  if (data.searchResults != null &&
                      data.searchResults!.vehicleInformation!.isNotEmpty &&
                      vehicleController!.text != '')
                    Card(
                      elevation: 4,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Center(
                            child: Text(
                              'Vehcile Information',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Vehicle Number: ",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        data.searchResults!
                                            .vehicleInformation![0].vehiclesNo
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.red)),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.network(
                                      'http://10.0.2.2:3000/' +
                                          data.searchResults!
                                              .vehicleInformation![0].image
                                              .toString(),
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      "Vehicle Image",
                                    ),
                                  ],
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Insurance Number: ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    data.searchResults!.vehicleInformation![0]
                                        .insurnceNumber
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Insurance Number: ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    data.searchResults!.vehicleInformation![0]
                                        .insurnceNumber
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Fitness Number: ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    data.searchResults!.vehicleInformation![0]
                                        .fitnessReportNumber
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  if (data.searchResults != null &&
                      data.searchResults!.vehicleInformation!.isNotEmpty &&
                      vehicleController!.text != '')
                    Card(
                      elevation: 4,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Center(
                            child: Text(
                              'Owner Information',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Owner Name: ",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        data.searchResults!.userInformation![0]
                                            .uName
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.red)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.network(
                                    'http://10.0.2.2:3000/' +
                                        data.searchResults!.userImage![0].image
                                            .toString(),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "Owner Image",
                                  ),
                                ],
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Mobile Number: ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    data.searchResults!.userInformation![0]
                                        .mobile
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Owner Address: ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    data.searchResults!.userImage![0].pAddress
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red)),
                              ),
                            ],
                          ),

                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Text("Fitness Number: ",
                          //         style: TextStyle(fontSize: 15, color: Colors.black),
                          //
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Text(data.searchResults!.vehicleInformation![0]
                          //           .fitnessReportNumber
                          //           .toString(),
                          //
                          //           style: TextStyle(fontSize: 15, color: Colors.red)),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          }),
          Expanded(
            child: Container(
              child: FutureBuilder<Vechile>(
                future: AdminRepository().getVehicleInformation(),
                builder:
                    (BuildContext context, AsyncSnapshot<Vechile> snapshot) {
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
                                Text(
                                  index.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.network(
                                      'http://10.0.2.2:3000/' +
                                          snapshot
                                              .data!.vehicles![index].image!,
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
                                      child: Text(snapshot.data!
                                          .vehicles![index].insurnceNumber!
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
          ),
        ],
      ),
    );
  }
}
