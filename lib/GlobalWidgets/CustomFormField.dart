import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? hintText;
  final String label;
  final bool obscureText;
  final bool? isCenterHint;
  final Color? color;
  final bool isEnabled;
  final bool numbersOnly;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;

  const CustomFormField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    required this.label,
    required this.obscureText,
    this.isCenterHint,
    this.color,
    this.validator,
    this.isEnabled = true,
    this.numbersOnly = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      validator: validator,
      obscureText: obscureText,
      keyboardType: numbersOnly
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      inputFormatters: numbersOnly
          ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$'))]
          : null,
      cursorColor: Colors.blue,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: FontWeight.bold,
      ),
      controller: controller,
      onChanged: onChanged,
      textAlign: isCenterHint == true ? TextAlign.center : TextAlign.left,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: color ?? Colors.grey),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12, color: Colors.blue),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}