import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:our_music/common/widgets/button/basic_app_button.dart';
import 'package:our_music/core/configs/assets/app_images.dart';
import 'package:our_music/core/configs/assets/app_vectors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 52,
              horizontal: 40,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.onboardingBG,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                    width: 196.0,
                  ),
                ),
                const Spacer(),
                const Text(
                  "User friendly mp3 music player for your device",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "We provide a better audio experien than others!",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white70,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                  onPressed: () {},
                  title: "Get Started",
                )
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
        ],
      ),
    );
  }
}
