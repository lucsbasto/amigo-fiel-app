import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final String labelText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: HexColor("#CAC4D0")),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#CAC4D0"))
                ),
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[500]),
                labelText: labelText,
                labelStyle: TextStyle(color: Colors.grey[500]),
              ),
            ),
          );
  }
}