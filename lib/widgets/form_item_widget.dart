import 'package:flutter/material.dart';

class FormItemWidget extends StatelessWidget {
  TextEditingController controller;
  String hint;
  IconData iconData;
  int maxLines;

  FormItemWidget({
    required this.controller,
    required this.hint,
    required this.iconData,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          prefixIconColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Color(0xff0f4c5c).withOpacity(0.8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
