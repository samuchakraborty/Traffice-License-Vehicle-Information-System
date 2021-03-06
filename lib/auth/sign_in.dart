import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traffice_information_system/admin/screen/admin_dash_board.dart';
import 'package:traffice_information_system/admin/services/admin_services.dart';
import 'package:traffice_information_system/constants.dart';
import 'package:traffice_information_system/police/screens/police_home_screen.dart';
import 'package:traffice_information_system/police/services/police_services.dart';
import 'package:traffice_information_system/user/screens/user_home_page.dart';
import 'package:traffice_information_system/auth/sign_up.dart';
import 'package:traffice_information_system/user/services/user_services.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';
import 'package:traffice_information_system/widgets/custom_text_field.dart';

class SignIn extends StatefulWidget {
  final bool isUser;
  final bool isAdmin;
  final bool isPolice;

  SignIn({required this.isAdmin, required this.isPolice, required this.isUser});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _secureText = true;
  final _formKey = GlobalKey<FormState>();
  late String mobile, password, policeBatchId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: widget.isUser
              ? Text('User Login'.tr)
              : (widget.isPolice ? Text('Police Login'.tr) : Text('Admin Login'.tr)),
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                margin: EdgeInsets.only(top: 50, left: 40, right: 30),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // alignment: Alignment.topCenter,
                        // margin: EdgeInsets.only(right: 120),
                        child: Text(
                          "Log In".tr,
                          style: h1TextStyle,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      if (widget.isPolice)
                        CustomTextField(
                          labelName: 'Batch Number'.tr,
                          hintTextName: 'Enter Your Batch Number'.tr,
                          textInputType: TextInputType.number,
                          onChangedFunction: (value) {
                            policeBatchId = value;
                          },
                          validateFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Batch Number'.tr;
                            }
                          },
                        ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        labelName: widget.isAdmin ? 'Email'.tr : 'Mobile'.tr,
                        hintTextName: widget.isAdmin
                            ? 'Enter Your Email Address'.tr
                            : 'Enter Your mobile Number'.tr,
                        textInputType: TextInputType.number,
                        onChangedFunction: (value) {
                          mobile = value;
                        },
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return widget.isAdmin
                                ? 'Please Enter Your Email Address'.tr
                                : 'Please Enter Your Mobile No'.tr;
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        labelName: 'Password'.tr,
                        hintTextName: 'Enter your password'.tr,
                        textInputType: TextInputType.visiblePassword,
                        obscureTextTy: _secureText,
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Password'.tr;
                          }
                        },
                        onChangedFunction: (value) {
                          //print(value);
                          password = value;
                        },
                        icon: _secureText
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        buttonName: 'LOG IN'.tr,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.isUser) {
                              FormData formData = FormData.fromMap(
                                  {'mobile': mobile, 'password': password});
                              Map<String, String> data = {
                                'mobile': mobile,
                                'password': password
                              };
                              NetworkHelper().login(data: data).then(
                                    (value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserHomePage(
                                            nidValue: value.toString()),
                                      ),
                                    ),
                                  );
                            } else if (widget.isPolice) {
                              // FormData formData = FormData.fromMap(
                              //     {'mobile': mobile, 'password': password});
                              Map<String, String> data = {
                                'batch_id': policeBatchId,
                                'mobile': mobile,
                                'password': password
                              };
                              print(data);
                              PoliceRepository().policeLogin(data: data).then(
                                    (value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PoliceHomePage(
                                            batchId: value.toString()),
                                      ),
                                    ),
                                  );
                            } else {
                              Map<String, String> data = {
                                'email': mobile,
                                'password': password
                              };
                              print(data);
                              AdminRepository()
                                  .adminLogin(data: data)
                                  .then((value) {
                                if (value == true) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminDashBoard(),
                                    ),
                                  );
                                }
                                else{

                                  print('Admin not valided');
                                }


                              });
                              //

                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            if (widget.isAdmin != true)
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    //  Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SignUp(isUser: widget.isUser ? true : false),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ".tr,
                        style: TextStyle(fontSize: 17, fontFamily: 'Poppins'),
                      ),
                      Text(
                        "Sign up ".tr,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.red,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
