import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:our_music/core/configs/assets/app_vectors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppVectors.logo,
          width: 196.0,
        ),
      ),
    );
  }
}
