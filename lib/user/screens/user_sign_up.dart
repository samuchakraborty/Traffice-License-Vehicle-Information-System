import 'package:flutter/material.dart';
import 'package:traffice_information_system/user/screens/user_sign_in.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';
import 'package:traffice_information_system/widgets/custom_text_field.dart';

import '../../constants.dart';

class UserSignUpPage extends StatefulWidget {
  @override
  _UserSignUpPageState createState() => _UserSignUpPageState();
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Sign Up'),
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
                labelName: 'User Name',
                hintTextName: 'Enter your user name',
                textInputType: TextInputType.text,
                onChangedFunction: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                labelName: 'Email',
                hintTextName: 'example@gmail.com',
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
                hintTextName: 'enter your password',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserLogIn(),
                    ),
                  );
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
