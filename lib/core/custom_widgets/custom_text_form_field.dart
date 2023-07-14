import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    Key? key,
    required this.prefix,
    this.suffix,
    this.suffixPressed,
    required this.label,
    required this.controller,
    this.submit,
  }) : super(key: key);

  final IconData prefix;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final String label;
  final TextEditingController controller;
  final void Function(String)? submit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(onPressed: suffixPressed, icon: Icon(suffix)),
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      controller: controller,
      onFieldSubmitted: submit,
    );
  }
}
