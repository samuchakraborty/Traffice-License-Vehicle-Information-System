import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traffice_information_system/auth/sign_in.dart';
import 'package:traffice_information_system/police/screens/police_home_screen.dart';
import 'package:traffice_information_system/police/services/police_services.dart';
import 'package:traffice_information_system/user/screens/user_home_page.dart';
import 'package:traffice_information_system/user/services/user_services.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';
import 'package:traffice_information_system/widgets/custom_text_field.dart';

import '../constants.dart';

class SignUp extends StatefulWidget {
  final bool isUser;

  SignUp({required this.isUser});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _secureText = true;

  final _formKey = GlobalKey<FormState>();
  late String mobile, password, policeBatchId, nidValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: widget.isUser ? Text('User Sign Up'.tr) : Text('Police Sign Up'.tr),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 80, left: 40, right: 30),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(right: 120),
                child: Center(
                  child: Text(
                    "Create Account".tr,
                    style: h1TextStyle,
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelName: widget.isUser
                          ? 'Nid Card Number'.tr
                          : 'Police Batch Number'.tr,
                      hintTextName: widget.isUser
                          ? 'Enter Your Nid Value'.tr
                          : 'Enter Your Batch Number'.tr,
                      textInputType: TextInputType.text,
                      onChangedFunction: (value) {
                        //  print(value);
                        if (widget.isUser) {
                          nidValue = value;
                        } else {
                          policeBatchId = value;
                        }
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      labelName: 'Mobile'.tr,
                      hintTextName: 'Enter Your mobile Number'.tr,
                      textInputType: TextInputType.number,
                      onChangedFunction: (value) {
                        //print(value);
                        mobile = value;
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
                      onChangedFunction: (value) {
                        // print(value);
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
                      buttonName: 'SIGN UP'.tr,
                      onPressed: () {
                        // Navigator.push(
                        //   context, MaterialPageRoute(builder: (context) => HomePage(),),);
                        if (_formKey.currentState!.validate()) {
                          if (widget.isUser) {
                            FormData formData = FormData.fromMap(
                                {'mobile': mobile, 'password': password});
                            Map<String, String> data = {
                              'nid_value': nidValue,
                              'mobile': mobile,
                              'password': password
                            };

                            print(data);
                            NetworkHelper().signUp(data: data).then(
                                  (value) =>
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UserHomePage(
                                              nidValue: value.toString()),
                                    ),
                                  ),
                            );
                          }else{

                            Map<String, String> data = {
                              'batchId': policeBatchId,
                              'mobile': mobile,
                              'password': password
                            };
                            print(data);
                            PoliceRepository().policeSignUp(data: data).then(
                                  (value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PoliceHomePage(
                                      batchId: value.toString()),
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pop(context);
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(
              //     //     builder: (context) => SignIn(),
              //     //   ),
              //     // );
              //   },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         "Already have an account? ",
              //         style: TextStyle(fontSize: 17),
              //       ),
              //       Text(
              //         "Log In ",
              //         style: TextStyle(
              //           fontSize: 17,
              //           color: Colors.red,
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
