import 'package:flutter/material.dart';
import 'package:traffice_information_system/constants.dart';


class UserInfo extends StatelessWidget {
  final String? labelName;
  final String? labelText;
  final bool isTrue;

  UserInfo({
    this.labelName, this.labelText,required this.isTrue});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Container(
          width: isTrue? 180: 120,
          child: Text(labelName!+ ':', style:labelNameStyle ,),),
        SizedBox(width: 10,),
        Text(labelText!, style: labelTextStyle,),
        SizedBox(width: 10,),
      ],
    );
  }
}
