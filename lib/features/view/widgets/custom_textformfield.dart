import 'package:flutter/material.dart';

import '../../../product/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryColor,
          fontSize: 16,
        ),
        enabledBorder: border(primaryColor),
        focusedBorder: border(primaryColor),
        focusedErrorBorder: border(Colors.red),
        errorBorder: border(Colors.red),
      ),
      validator: validator,
    );
  }

  UnderlineInputBorder border(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
    );
  }
}
