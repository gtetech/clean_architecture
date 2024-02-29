import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
        required this.fieldHint,
        required this.labelHint,
        required this.controller,
        this.isPassword = false,
        this.error});

  final String fieldHint;
  final String labelHint;
  final TextEditingController controller;
  final String? error;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    bool isError = error != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            !isError ? labelHint : error ?? '',
            style: TextStyle(
              color: !isError ? const Color(0xffa3a5a9) : Colors.red,
              fontSize: 14,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: error == null
                    ? null
                    : Border.all(color: Colors.red, width: 1),
                color: const Color(0xff2c313f)),
            child: TextField(
              obscureText: isPassword,
              controller: controller,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: fieldHint,
                hintStyle: const TextStyle(
                    height: 4,
                    color: Color(0xffa3a5a9),
                    fontWeight: FontWeight.w300),
              ),
            )),
      ],
    );
  }
}