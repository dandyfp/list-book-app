import 'package:flutter/material.dart';

class KTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  const KTextfield({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          isDense: true,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade800),
          ),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white10))),
    );
  }
}
