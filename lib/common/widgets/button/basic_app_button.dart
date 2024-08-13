import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(
          height ?? 64,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}
