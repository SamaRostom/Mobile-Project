import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  final String text;
  const CustomButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text,
          style: const TextStyle(
            fontSize: 16,
          )),
      style: ElevatedButton.styleFrom(minimumSize: Size(width, 50)),
    );
  }
}
