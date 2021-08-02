import 'package:flutter/material.dart';
import 'package:traffice_information_system/constants.dart';
import 'package:traffice_information_system/user/screens/user_home_page.dart';
import 'package:traffice_information_system/user/services/user_services.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';
import 'package:traffice_information_system/widgets/custom_text_field.dart';

class UserLogIn extends StatefulWidget {
  @override
  _UserLogInState createState() => _UserLogInState();
}

class _UserLogInState extends State<UserLogIn> {
  bool _secureText = true;
  final _formKey = GlobalKey<FormState>();
  late String mobile, password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Login'),
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                margin: EdgeInsets.only(top: 80, left: 40, right: 30),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(right: 120),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: h1TextStyle,
                            maxLines: 2,
                          ),
                        ),
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
                            return 'Please Enter Your Flat No';
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        labelName: 'Password',
                        hintTextName: 'enter your password',
                        textInputType: TextInputType.visiblePassword,
                        obscureTextTy: _secureText,
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Flat No';
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
                            var data = {'mobile': mobile, 'password': password};

                            NetworkHelper().login(data: data).then(
                                  (value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserHomePage(
                                          nidValue: value.toString()),
                                    ),
                                  ),
                                );
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
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
