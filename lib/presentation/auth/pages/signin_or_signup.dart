import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:our_music/common/helpers/is_dark_theme.dart';
import 'package:our_music/common/widgets/appBar/app_bar.dart';
import 'package:our_music/common/widgets/button/basic_app_button.dart';
import 'package:our_music/core/configs/assets/app_vectors.dart';
import 'package:our_music/presentation/auth/pages/sign_in.dart';
import 'package:our_music/presentation/auth/pages/sign_up.dart';

class SigninOrSignupPage extends StatelessWidget {
  const SigninOrSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern,
            ),
          ),
          Transform.scale(
            scaleX: -1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(
                AppVectors.bottomPattern,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.logo,
                    width: 196.0,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const Text(
                    "Listen to the best audio & music with us now!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    "Our Music is the best audio streaming and media services provider",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignInPage(),
                        ),
                      );
                    },
                    title: "Sign In",
                    textColor: context.isDarkMode ? Colors.white : Colors.black,
                    backgroundColor:
                        context.isDarkMode ? Colors.white10 : Colors.white70,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignUpPage(),
                        ),
                      );
                    },
                    title: "Register",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
