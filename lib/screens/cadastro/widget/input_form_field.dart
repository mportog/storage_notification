import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final TextEditingController controller;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final TextInputType keyboardType;
  final bool obscureText;
  final String label;
  final String hint;

  const InputForm(
      {this.controller,
      this.validator,
      this.onSaved,
      this.keyboardType = TextInputType.emailAddress,
      this.obscureText = false,
      this.label,
      this.hint});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
