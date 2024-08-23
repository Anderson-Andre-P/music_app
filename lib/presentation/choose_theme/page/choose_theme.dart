import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_music/core/configs/theme/app_colors.dart';
import 'package:our_music/presentation/auth/pages/signin_or_signup.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../bloc/theme_cubit.dart';

class ChooseThemePage extends StatefulWidget {
  const ChooseThemePage({super.key});

  @override
  State<ChooseThemePage> createState() => _ChooseThemePageState();
}

class _ChooseThemePageState extends State<ChooseThemePage> {
  bool isDarkMode = true;

  void _toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
    if (isDarkMode) {
      context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
    } else {
      context.read<ThemeCubit>().updateTheme(ThemeMode.light);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 240.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                isDarkMode ? AppVectors.darkMode : AppVectors.lightMode,
                width: 196.0,
              ),
            ),
          ),
          Container(
            color: isDarkMode ? Colors.black.withOpacity(0.35) : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 52,
              horizontal: 40,
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
                Text(
                  "Choice the theme off our Music App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : AppColors.darkGrey,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Select an theme to personalize your experience...",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: isDarkMode ? Colors.white70 : AppColors.darkGrey,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 52,
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: _toggleTheme,
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primary,
                  inactiveThumbColor: AppColors.primary,
                  inactiveTrackColor: Colors.white,
                  thumbIcon: WidgetStatePropertyAll(
                    isDarkMode
                        ? const Icon(
                            Icons.dark_mode,
                            color: AppColors.primary,
                          )
                        : const Icon(
                            Icons.light_mode,
                            color: Colors.white,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 52,
                ),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SigninOrSignupPage(),
                      ),
                    );
                  },
                  title: "Play musics",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
