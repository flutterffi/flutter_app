import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    this.hintText,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.fieldKey,
    super.key,
  });

  final String label;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Key? fieldKey;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: fieldKey,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
