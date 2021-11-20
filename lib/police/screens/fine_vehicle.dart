import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traffice_information_system/user/screens/user_home_page.dart';
import 'package:traffice_information_system/user/services/user_services.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';
import 'package:traffice_information_system/widgets/custom_headerButton.dart';
import 'package:traffice_information_system/widgets/custom_text_field.dart';

class FineReport extends StatefulWidget {
  @override
  _FineReportState createState() => _FineReportState();
}

class _FineReportState extends State<FineReport> {
  List _typeOfLicence = [];
  List _myQulifican = [];
  File? imageFile;
  String? vehicleNumber, address;

  @override
  Widget build(BuildContext context) {
    // print(widget.userId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fine By vehicle Number"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  //  initialValue: widget.userName,
                  labelName: 'Enter Your Vehicle Number',
                  hintTextName: '',
                  onChangedFunction: (val) {
                    vehicleNumber = val;
                  },
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  //  initialValue: widget.userName,
                  labelName: 'Enter The Reason ',
                  hintTextName: '',
                  onChangedFunction: (val) {
                    address = val;
                  },
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                //  initialValue: widget.userName,
                  labelName: 'Enter The Amount ',

                  hintTextName: '',
                  onChangedFunction: (val) {
                    address = val;
                  },
                  textInputType: TextInputType.number),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: CustomButton(
                    onPressed: () {
                      //s      print(_typeOfLicence);
                      //  _applyForDL();
                      Navigator.pop(context);
                    },
                    buttonName: 'Fine'),
              )
            ],
          ),
        ),
      ),
    );
  }

  _applyForDL() async {
    FormData formData = FormData.fromMap({
      // 'uid': widget.userId,
      //  'n_id': widget.nid,
      'vehicles_no': vehicleNumber,
      'address': address,
      // 'fitness_number': vehicleFitnessNumber,
      // 'profileFile': await dio.MultipartFile.fromFile(imageFile!.path,
      //     filename: imageFile!.path.split('/').last),
      //  'typeOfV': _myQulifican.join(','),
//'typeOfV': ,
// 'insurance_date': ,
      // 'application_date': DateTime.now().toString(),
      // 'address': customerAddress,
      // 'active': 1
    });

    print(formData.fields);

    // NetworkHelper().report(data: formData).then((value) =>
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => UserHomePage(
    //          // nidValue: widget.nid,
    //         ),
    //       ),
    //     ),

    //  );
    // dio.Response response =
    // await CustomerRepository.addNewCustomer(
    //     data: formData);
    // print(response.data);
    //  if (response.data['code'] == 201) {
    //   // toast(response.data['message']);
    //    print(response.data);
    //    Navigator.pop(context);
    //  } else if(response.data['code'] == 422) {
    //    //toast(response.data['message']);
    //  }
  }

  _openGallery(BuildContext context) async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    final File file = File(pickedFile!.path);
    // imageFileupload= pickedFile;
    String filepath = pickedFile.path;
    print(filepath);
    setState(() {
      imageFile = file;
    });
  }

  _openCamera(BuildContext context) async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.rear);
    final File file = File(pickedFile!.path);
    // imageFileupload= pickedFile;
    String filepath = pickedFile.path;
    print(filepath);
    setState(() {
      imageFile = file;
    });
    // Navigator.of(context).pop();
  }

  selectedItem(BuildContext context, int index) {
    // Navigator.of(context).pop();
    switch (index) {
      case 0:
        _openCamera(context);
        Navigator.of(context).pop();
        break;
      case 1:
        _openGallery(context);
        Navigator.of(context).pop();
        break;
    }
  }
}

Widget _bottomSheetOptions({
  required String? label,
  required String icon,
  VoidCallback? onClicked,
}) {
  return Container(
    width: 120,
    height: 120,
    child: GestureDetector(
      onTap: onClicked,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 50,
            height: 50,
          ),
          Text(
            label!,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
