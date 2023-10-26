import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double width;
  final double height;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.width = 330,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        border: Border.all(color: Theme.of(context).primaryColor),
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
