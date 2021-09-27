import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traffice_information_system/police/provider/vehicle_provider.dart';

class VerifyLicense extends ConsumerWidget {
  final TextEditingController? vehicleController = TextEditingController();
//  late String searchQuery = '';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final data = watch(getVehicleProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Verify User Driving License"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: vehicleController,
              onChanged: (value) {
               // searchQuery = value;
              },
            ),
            TextButton(
              onPressed: () {
                context
                    .read(getVehicleProvider)
                    .placeSearch(searchValue: vehicleController!.text);
                vehicleController!.clear();
               // searchQuery = '';
              },
              child: Text("Submit"),
            ),
            //if (searchQuery.isNotEmpty)

            //  if (data.searchResults != null && vehicleController!.text.length != 0)
            Text(data.searchResults!.msg.toString()),
            if (data.searchResults!.vehicleInformation!.isNotEmpty)
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text(
                              "Vehicle Number: ",
                              style:
                              TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(data.searchResults!.vehicleInformation![0]
                                .vehiclesNo
                                .toString()),
                          ],
                        ),
                        Image.network(
                          'http://10.0.2.2:3000/' +
                              data.searchResults!.vehicleInformation![0].image
                                  .toString(),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text("Insurance Number: "),
                        SizedBox(
                          width: 10,
                        ),
                        Text(data.searchResults!.vehicleInformation![0]
                            .insurnceNumber
                            .toString()),
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
