import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traffice_information_system/police/models/license_model.dart';
import 'package:traffice_information_system/police/models/vehicle_model.dart';
import 'package:traffice_information_system/police/services/police_services.dart';

final getVehicleProvider =
    ChangeNotifierProvider<VehicleProvider>((ref) => VehicleProvider());

class VehicleProvider extends ChangeNotifier {
  VehicleInfo? searchResults;

  void placeSearch({required searchValue}) async {

    searchResults = await PoliceRepository()
        .getVehicleInformation(vehicleNumber: searchValue);
   // print(searchResults);
    notifyListeners();
  }
}



final getLicenseProvider =
ChangeNotifierProvider<LicenseProvider>((ref) => LicenseProvider());

class LicenseProvider extends ChangeNotifier {
  LicenseInfo? searchResults;

  void placeSearch({required searchValue}) async {

    searchResults = await PoliceRepository()
        .getLicenseInformation(licenseNumber: searchValue);
    // print(searchResults);
    notifyListeners();
  }
}
