import 'package:flutter/material.dart';

class CustomFormFieldWidget extends StatelessWidget {
  final TextEditingController formController ;
  final String hint ; 
  final String label; 

  const CustomFormFieldWidget({super.key, required this.formController, required this.hint, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: formController ,
        decoration: InputDecoration(
          hintText: hint, 
          label: Text(label),
        ),
      ),
    );
  }
}