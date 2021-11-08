import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:traffice_information_system/user/services/user_services.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';
import 'package:traffice_information_system/widgets/custom_headerButton.dart';
import 'package:traffice_information_system/widgets/custom_text_field.dart';

class AddVehicleByAdmin extends StatefulWidget {


  @override
  _AddVehicleByAdminState createState() => _AddVehicleByAdminState();
}

class _AddVehicleByAdminState extends State<AddVehicleByAdmin> {
  List _typeOfLicence = [];
  List _myQulifican = [];
  File? imageFile;
  String? vehicleNumber, vehicleFitnessNumber, vehicleInsurance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add vehicle  Information"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    child: imageFile != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        imageFile!,
                        //width: 100,
                        //height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/avatar.jpg',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  IconButton2(
                    label: 'PHOTO_UPLOAD',
                    icon: Icons.camera_alt_outlined,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'Select Source',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                padding: EdgeInsets.only(top: 20),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 4,
                                child: GridView(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    _bottomSheetOptions(
                                        label: 'Camera',
                                        icon: 'assets/camera_colored.png',
                                        onClicked: () =>
                                            selectedItem(context, 0)),
                                    _bottomSheetOptions(
                                        label: 'Gallery',
                                        icon: 'assets/gallery.png',
                                        onClicked: () =>
                                            selectedItem(context, 1)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              CustomTextField(
               //   initialValue: widget.userName,
                  labelName: 'User Name',
                  hintTextName: '',
                  onChangedFunction: (val) {},
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                //  initialValue: widget.nid,
                  labelName: 'Nid Number',
                  hintTextName: '',
                  onChangedFunction: (val) {},
                  textInputType: TextInputType.text),
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
                  labelName: 'Enter Your Insurance NUmber',
                  hintTextName: '',
                  onChangedFunction: (val) {
                    vehicleInsurance = val;
                  },
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                //  initialValue: widget.userName,
                  labelName: 'Enter Your Fitness Report NUmber',
                  hintTextName: '',
                  onChangedFunction: (val) {
                    vehicleInsurance = val;
                  },
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: CustomButton(
                    onPressed: () {
                      //s      print(_typeOfLicence);
                      _applyForDL();
                    },
                    buttonName: 'Add Vechile Information'),
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
     // 'n_id': widget.nid,
      'vehicles_no': vehicleNumber,
      'insurance_number': vehicleInsurance,
      'fitness_number': vehicleFitnessNumber,
      'profileFile': await dio.MultipartFile.fromFile(imageFile!.path,
          filename: imageFile!.path.split('/').last),
      //  'typeOfV': _myQulifican.join(','),
//'typeOfV': ,
// 'insurance_date': ,
      // 'application_date': DateTime.now().toString(),
      // 'address': customerAddress,
      // 'active': 1
    });

    print(imageFile!.path.split('/').last);

    NetworkHelper().addVehicle(data: formData).then((value) => print(value));
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
