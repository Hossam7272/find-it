import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/myform.dart';

class UploadForms extends StatelessWidget {
  TextEditingController locationController;
  TextEditingController nameController;
  void Function()? dateFunction;
  UploadForms({super.key,required this.nameController,required this.locationController,required this.dateFunction});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        MyForm(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a value ';
            }
          },
          txt: 'Where did you find or lost it?',
          controller: locationController,
        ),
        SizedBox(
          height: 15.h,
        ),
        MyForm(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a value ';
            }
          },
          txt: 'Name',
          controller: nameController,
        ),
        ListTile(
          title: const Text('What was the time'),
          leading: IconButton(
            onPressed: dateFunction,
            icon: const Icon(Icons.date_range),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
