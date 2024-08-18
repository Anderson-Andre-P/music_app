import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_music/common/helpers/is_dark_theme.dart';
import 'package:our_music/core/configs/theme/app_colors.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    super.key,
    required this.icon,
    required this.press,
  });

  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.lightBackground
              : AppColors.darkBackground,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
