import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:traffice_information_system/police/provider/vehicle_provider.dart';

class VerifyLicense extends ConsumerWidget {
  final TextEditingController? vehicleController = TextEditingController();

//  late String searchQuery = '';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final data = watch(getLicenseProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Verify User Driving License"),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: "Please Enter License Number "),
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
                  Center(child: Text(data.searchResults!.msg.toString(), style: TextStyle(color: Colors.redAccent, fontSize: 18),)),
                ],
              ),

            SizedBox(height: 10,),
            if (data.searchResults != null &&
                data.searchResults!.licenseInformation!.isNotEmpty &&
                vehicleController!.text != '')
              Card(
                elevation: 4,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 10,
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "License Number: ",
                          style: TextStyle(fontSize: 15, color: Colors.black),

                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(data.searchResults!.licenseInformation![0].lcNo
                            .toString(),

                        style: TextStyle(fontSize: 15, color: Colors.red)),

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
                            children: [
                              Row(
                                children: [
                                  Text('User Name: ',  style:
                                  TextStyle(fontSize: 14, color: Colors.black),),
                                  Text(
                                    data.searchResults!.licenseInformation![0].name
                                        .toString(),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('User Mobile: ',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.black),),
                                  Text(
                                    data.searchResults!.userInformation![0].mobile
                                        .toString(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('User National Id Card: '),
                                  Text(
                                    data.searchResults!.userInformation![0].nId
                                        .toString(),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          Image.network(
                            'http://10.0.2.2:3000/' +
                                data.searchResults!.licenseInformation![0].image
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
                                DateTime.parse(data.searchResults!
                                    .licenseInformation![0].applicationDate
                                    .toString()),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
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
