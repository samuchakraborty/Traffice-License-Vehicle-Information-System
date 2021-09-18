import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';
import 'package:traffice_information_system/widgets/custom_text_field.dart';

class ApplyForLicence extends StatefulWidget {
  final String userName;

  ApplyForLicence({required this.userName});

  @override
  _ApplyForLicenceState createState() => _ApplyForLicenceState();
}

class _ApplyForLicenceState extends State<ApplyForLicence> {
  List _myActivities =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply For Driving License"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextField(
                  initialValue: widget.userName,
                  labelName: 'User Name',
                  hintTextName: '',
                  onChangedFunction: (val) {},
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),

              // Container(
              //   height: 80,
              //   child: Row(
              //     children: [
              //       Expanded(child: TextFormField()),
              //       Container(
              //         width: 100,
              //         child: ElevatedButton(
              //             child: Text(
              //               'Type',
              //               style: TextStyle(
              //                   fontSize: 16, color: Colors.amberAccent),
              //             ),
              //             onPressed: () async {
              //               flavours = await showDialog<List<String>>(
              //                     context: context,
              //                     builder: (_) => MultiSelectDialog2(
              //                       question:
              //                           Text('Select Your testFacilities'),
              //                       answers: [
              //                         'samy',
              //                         "you",
              //                         "gieo",
              //                         "hello",
              //                       ],
              //                     ),
              //                   ) ??
              //                   [];
              //               print(flavours);
              //               // Logic to save selected flavours in the database
              //             }),
              //       ),
              //     ],
              //   ),
              // ),
              // // MultiSelect(
              // //     autovalidate: false,
              // //     titleText: title,
              // //     validator: (value) {
              // //       if (value == null) {
              // //         return 'Please select one or more option(s)';
              // //       }
              // //     },
              // //     errorText: 'Please select one or more option(s)',
              // //     dataSource: [
              // //       {
              // //         "display": "Australia",
              // //         "value": 1,
              // //       },
              // //       {
              // //         "display": "Canada",
              // //         "value": 2,
              // //       },
              // //       {
              // //         "display": "India",
              // //         "value": 3,
              // //       },
              // //       {
              // //         "display": "United States",
              // //         "value": 4,
              // //       }
              // //     ],
              // //     textField: 'display',
              // //     valueField: 'value',
              // //     filterable: true,
              // //     required: true,
              // //     value: null,
              // //     onSaved: (value) {
              // //       print('The value is $value');
              // //     }
              // // ),
              MultiSelectFormField(
                autovalidate: false,
                chipBackGroundColor: Colors.red,
                chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                checkBoxActiveColor: Colors.red,
                checkBoxCheckColor: Colors.green,
                dialogShapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                title: Text(
                  "Type Of License  ",
                  style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.w700, fontSize: 18),
                ),
                dataSource: [
                  {
                    "display": "Light",
                    "value": "Light",
                  },
                  {
                    "display": "Heavy",
                    "value": "Heavy",
                  },
                  // {
                  //   "display": "Walking",
                  //   "value": "Walking",
                  // },
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                hintWidget: Text('Please choose one or more'),
                initialValue: _myActivities,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _myActivities = value;
                  });
                  print(value.join(','));
                },
              ),

              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  initialValue: widget.userName,
                  labelName: 'User Name',
                  hintTextName: '',
                  onChangedFunction: (val) {},
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  initialValue: widget.userName,
                  labelName: 'User Name',
                  hintTextName: '',
                  onChangedFunction: (val) {},
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  initialValue: widget.userName,
                  labelName: 'User Name',
                  hintTextName: '',
                  onChangedFunction: (val) {},
                  textInputType: TextInputType.text),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                  onPressed: () {}, buttonName: 'Apply For Driving Licence')
            ],
          ),
        ),
      ),
    );
  }
}
