import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traffice_information_system/police/provider/vehicle_provider.dart';

class VerifyVehicle extends ConsumerWidget {
  final TextEditingController? vehicleController = TextEditingController();
  late String searchQuery = '';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final data = watch(getVehicleProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Verify User Vehicle Number"),
        ),
        body: ListView(

          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: "Please Enter Vehicle Number "),
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
            if (data.searchResults != null && vehicleController!.text != '')
              Center(
                child: Text(
                  data.searchResults!.msg.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.redAccent),
                ),
              ),
            SizedBox(height: 30,),
            if (data.searchResults != null &&
                data.searchResults!.vehicleInformation!.isNotEmpty &&
                vehicleController!.text != '')
              Card(
                elevation: 4,
                child: ListView(

                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Center(child: Text('Vehcile Information', style: TextStyle(fontSize: 16, color: Colors.red),),)
                    ,
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
                                style: TextStyle(fontSize: 15, color: Colors.black),

                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.searchResults!.vehicleInformation![0]
                                  .vehiclesNo
                                  .toString(),

                                  style: TextStyle(fontSize: 15, color: Colors.red)

                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network(
                              'http://10.0.2.2:3000/' +
                                  data.searchResults!.vehicleInformation![0]
                                      .image
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
                          child: Text("Insurance Number: ",
                            style: TextStyle(fontSize: 15, color: Colors.black),


                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data.searchResults!.vehicleInformation![0]
                              .insurnceNumber
                              .toString(),

                              style: TextStyle(fontSize: 15, color: Colors.red)),
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
                          child: Text("Insurance Number: ",
                            style: TextStyle(fontSize: 15, color: Colors.black),


                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data.searchResults!.vehicleInformation![0]
                              .insurnceNumber
                              .toString(),

                              style: TextStyle(fontSize: 15, color: Colors.red)
                          ),
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
                          child: Text("Fitness Number: ",
                            style: TextStyle(fontSize: 15, color: Colors.black),

                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data.searchResults!.vehicleInformation![0]
                              .fitnessReportNumber
                              .toString(),

                              style: TextStyle(fontSize: 15, color: Colors.red)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(height: 10,),
            if (data.searchResults != null &&
                data.searchResults!.vehicleInformation!.isNotEmpty &&
                vehicleController!.text != '')
              Card(
                elevation: 4,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Center(child: Text('Owner Information', style: TextStyle(fontSize: 16, color: Colors.red),),)
              ,      Row(
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
                                style: TextStyle(fontSize: 15, color: Colors.black),

                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.searchResults!.userInformation![0]
                                  .uName
                                  .toString(),

                                  style: TextStyle(fontSize: 15, color: Colors.red)

                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network(
                              'http://10.0.2.2:3000/' +
                                  data.searchResults!.userImage![0]
                                      .image
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
                          child: Text("Mobile Number: ",
                            style: TextStyle(fontSize: 15, color: Colors.black),


                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data.searchResults!.userInformation![0]
                              .mobile
                              .toString(),

                              style: TextStyle(fontSize: 15, color: Colors.red)),
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
                          child: Text("Owner Address: ",
                            style: TextStyle(fontSize: 15, color: Colors.black),


                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data.searchResults!.userImage![0]
                              .pAddress
                              .toString(),

                              style: TextStyle(fontSize: 15, color: Colors.red)
                          ),
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
      ),
    );
  }
}

//
// class VehicleInformation extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return  Card(
//       elevation: 4,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Text("Vehicle Number: "),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(data.searchResults!.vehicleInformation![0]
//                       .vehiclesNo
//                       .toString()),
//                 ],
//               ),
//               Image.network(
//                 'http://10.0.2.2:3000/' +
//                     data.searchResults!.vehicleInformation![0].image
//                         .toString(),
//                 width: 100,
//                 height: 100,
//                 fit: BoxFit.cover,
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
