import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.labelName,
      required this.hintTextName,
      required this.onChangedFunction,
      required this.textInputType,
      this.onPressed,
      this.validateFunction,
      this.initialValue,
      this.maxLines,
      this.icon,
      this.obscureTextTy = false});

  final String labelName;
  final String hintTextName;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validateFunction;
  final ValueChanged onChangedFunction;
  final int? maxLines;

  final Function()? onPressed;
  final IconData? icon;
  final bool obscureTextTy;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
//              mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            labelName,
            style: TextStyle(
                color: Colors.red.shade800,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
        ),
        TextFormField(
          keyboardType: textInputType,
          // autofocus: true,
          initialValue: initialValue,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.red, fontSize: 20),
            hintText: hintTextName,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
            //isDense: true,                      // Added this
            //  contentPadding: EdgeInsets.all(15),
            suffixIcon: IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
            ),
          ),
          onChanged: onChangedFunction,
          obscureText: obscureTextTy,
          validator: validateFunction,
         // maxLines: maxLines!,
        ),
      ],
    );
  }
}
