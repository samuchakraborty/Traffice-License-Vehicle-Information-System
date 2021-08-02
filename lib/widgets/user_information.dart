import 'package:flutter/material.dart';
import 'package:traffice_information_system/constants.dart';


class UserInfo extends StatelessWidget {
  final String? labelName;
  final String? labelText;

  UserInfo({
    this.labelName, this.labelText});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [

        Container(
          width: 120,
          child: Text(labelName!+ ':', style:labelNameStyle ,),),
        SizedBox(width: 10,),
        Text(labelText!, style: labelTextStyle,),
      ],
    );
  }
}
