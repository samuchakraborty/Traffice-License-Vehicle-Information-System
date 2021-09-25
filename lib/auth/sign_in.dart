import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
              ? Text('User Login')
              : (widget.isPolice ? Text('Police Login') : Text('Admin Login')),
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
                          "Log In",
                          style: h1TextStyle,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      if(widget.isPolice)
                      CustomTextField(
                        labelName: 'Batch Number',
                        hintTextName: 'Enter Your Batch Number',
                        textInputType: TextInputType.number,
                        onChangedFunction: (value) {
                          policeBatchId = value;
                        },
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Batch Number';
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      CustomTextField(
                        labelName: 'Mobile',
                        hintTextName: 'Enter Your mobile Number',
                        textInputType: TextInputType.number,
                        onChangedFunction: (value) {
                          mobile = value;
                        },
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Mobile No';
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        labelName: 'Password',
                        hintTextName: 'Enter your password',
                        textInputType: TextInputType.visiblePassword,
                        obscureTextTy: _secureText,
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Password';
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
                        buttonName: 'LOG IN',
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
                                    (value) =>

                                        Navigator.push(
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
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 17, fontFamily: 'Poppins'),
                      ),
                      Text(
                        "Sign up ",
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
