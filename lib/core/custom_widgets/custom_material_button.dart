import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {Key? key, required this.pressed, required this.text})
      : super(key: key);
  final VoidCallback pressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      color: Colors.grey[400],
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        onPressed: pressed,
        child: Text(text),
      ),
    );
  }
}
