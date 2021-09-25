import 'package:flutter/material.dart';
import 'package:traffice_information_system/auth/sign_in.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: widget.isUser ? Text('User Sign Up') : Text('Police Sign Up'),
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
                    "Create Account",
                    style: h1TextStyle,
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelName: 'Nid Card Number',
                hintTextName: 'Enter Your Nid Value',
                textInputType: TextInputType.text,
                onChangedFunction: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                labelName: 'Mobile Number',
                hintTextName: 'Enter Your Mobile Number',
                textInputType: TextInputType.emailAddress,
                onChangedFunction: (value) {
                  print(value);
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
                onChangedFunction: (value) {
                  print(value);
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
                buttonName: 'SIGN UP',
                onPressed: () {
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (context) => HomePage(),),);
                },
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SignIn(),
                  //   ),
                  // );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "Log In ",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
