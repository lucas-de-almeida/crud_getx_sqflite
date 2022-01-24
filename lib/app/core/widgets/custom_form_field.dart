import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final bool? onlyNumber;
  const CustomFormField({
    Key? key,
    required this.label,
    this.suffixIconButton,
    this.controller,
    this.validator,
    this.focusNode,
    this.onlyNumber = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      keyboardType: onlyNumber!
          ? const TextInputType.numberWithOptions()
          : TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
        isDense: true,
      ),
    );
  }
}
