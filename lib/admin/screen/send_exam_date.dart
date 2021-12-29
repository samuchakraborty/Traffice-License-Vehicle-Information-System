import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traffice_information_system/admin/screen/UserList.dart';
import 'package:traffice_information_system/admin/services/admin_services.dart';
import 'package:traffice_information_system/widgets/custom_button.dart';

class SentExamDate extends StatefulWidget {
  final String label;
  final String license;

  SentExamDate({required this.label, required this.license});

  @override
  State<SentExamDate> createState() => _SentExamDateState();
}

class _SentExamDateState extends State<SentExamDate> {
  late TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exam Date for ' + widget.label),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.00),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Exam Date'),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 1.5),
                    ),
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width / 3,
                    child: DateTimePicker(
                      type: DateTimePickerType.dateTime,
                      controller: controller,
                      dateHintText: 'Exam Date',
                      timeHintText: 'Exam Date',
                      dateLabelText: controller.text,
                      timeLabelText: controller.text,
                      initialDate: DateTime.now(),
                      initialTime: TimeOfDay.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      // locale: Locale('bn', 'BD'),
                      onChanged: (val) {
                        setState(() {
                          controller.text = val.toString();
                        });
                      },
                      validator: (val) {
                        //  method(val!);
                      },
                      onSaved: (val) {
                        setState(() {
                          controller.text = val.toString();
                        });

                        //  method(val!);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              child: CustomButton(
                  onPressed: () {
                    AdminRepository()
                        .updateExamDate(
                            licenseNo: widget.license,
                            examDate: controller.text.toString().split(' ')[0])
                        .then((value) {
                      if (value == true) {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserList(),
                          ),
                        );
                      }
                    });
                  },
                  buttonName: 'Change Exam Date'),
            ),
          ],
        ),
      ),
    );
  }
}
