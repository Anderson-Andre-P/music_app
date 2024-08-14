import 'package:flutter/material.dart';
import 'package:our_music/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(
          height ?? 64,
        ),
        backgroundColor: backgroundColor ?? AppColors.primary,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
