import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({Key? key, required this.controller, required this.icon})
      : super(key: key);
  TextEditingController controller = TextEditingController();

  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'please enter a valid value';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(  borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),

          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),

          suffixIcon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}