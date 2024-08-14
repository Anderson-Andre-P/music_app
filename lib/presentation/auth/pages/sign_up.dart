import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:our_music/common/widgets/appBar/app_bar.dart';
import 'package:our_music/common/widgets/button/basic_app_button.dart';
import 'package:our_music/core/configs/assets/app_vectors.dart';
import 'package:our_music/core/configs/theme/app_colors.dart';
import 'package:our_music/presentation/auth/pages/sign_in.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 148.0,
        ),
      ),
      bottomNavigationBar: _signInText(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 60.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(
                height: 32.0,
              ),
              _fullNameField(context),
              const SizedBox(
                height: 32.0,
              ),
              _emailField(context),
              const SizedBox(
                height: 32.0,
              ),
              _passwordField(context),
              const SizedBox(
                height: 32.0,
              ),
              BasicAppButton(
                onPressed: () {},
                title: "Create Account",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primary,
      decoration: const InputDecoration(hintText: "Full Name").applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primary,
      decoration: const InputDecoration(hintText: "Enter E-mail").applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primary,
      decoration: const InputDecoration(hintText: "Password").applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Do you have an account?",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12.0,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SignInPage(),
                ),
              );
            },
            child: const Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
