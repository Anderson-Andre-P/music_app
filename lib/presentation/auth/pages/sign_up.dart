import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:our_music/common/widgets/appBar/app_bar.dart';
import 'package:our_music/common/widgets/button/basic_app_button.dart';
import 'package:our_music/core/configs/assets/app_vectors.dart';
import 'package:our_music/core/configs/theme/app_colors.dart';
import 'package:our_music/data/models/auth/create_user_req.dart';
import 'package:our_music/domain/usecases/auth/sign_up.dart';
import 'package:our_music/presentation/auth/pages/sign_in.dart';
import 'package:our_music/presentation/auth/pages/widgets/social_icons.dart';
import 'package:our_music/presentation/home/pages/home.dart';
import 'package:our_music/service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                onPressed: () async {
                  var result = await sl<SignUpUseCase>().call(
                    params: CreateUserReq(
                      fullName: _fullName.text.toString(),
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    ),
                  );
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(
                        content: Text(l),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        snackbar,
                      );
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (
                            BuildContext context,
                          ) =>
                              const HomePage(),
                        ),
                        (route) => false,
                      );
                    },
                  );
                },
                title: "Create Account",
              ),
              const SocialIcons(),
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
      controller: _fullName,
      cursorColor: AppColors.primary,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "Full Name",
        labelText: "Full Name",
        labelStyle: TextStyle(
          color: AppColors.primary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      )
          .applyDefaults(
            Theme.of(context).inputDecorationTheme,
          )
          .copyWith(
            suffixIcon: const Icon(
              Icons.person,
            ),
          ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      cursorColor: AppColors.primary,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "Enter E-mail",
        labelText: "Email",
        labelStyle: TextStyle(
          color: AppColors.primary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      )
          .applyDefaults(
            Theme.of(context).inputDecorationTheme,
          )
          .copyWith(
            suffixIcon: const Icon(
              Icons.mail,
            ),
          ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      cursorColor: AppColors.primary,
      textInputAction: TextInputAction.next,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Password",
        labelText: "Password",
        labelStyle: TextStyle(
          color: AppColors.primary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      )
          .applyDefaults(
            Theme.of(context).inputDecorationTheme,
          )
          .copyWith(
            suffixIcon: const Icon(
              Icons.lock,
            ),
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
                  builder: (BuildContext context) => SignInPage(),
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
