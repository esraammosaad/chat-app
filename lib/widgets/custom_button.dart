import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          onPressed: onPressed,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          color: const Color(0xFF771F98),
          height: 46,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF771F98)),
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: Color(0xFFF3F3F3),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}