import 'package:flutter/material.dart';


const labelNameStyle = TextStyle(
  fontSize: 18,
  color: Colors.red
);


const labelTextStyle = TextStyle(
    fontSize: 18,
  color: Colors.green

);








const h1TextStyle = TextStyle(
  fontSize: 30,
  color: Colors.black87,
  fontWeight: FontWeight.w500,
);

ButtonStyle buttonStyleContinue = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.red.shade800),
  fixedSize: MaterialStateProperty.all(
    Size(
      400,
      60,
    ),
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red))),
);

const emailTextStyle = TextStyle(fontSize: 15);
