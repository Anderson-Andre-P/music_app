import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:our_music/common/widgets/appBar/app_bar.dart';
import 'package:our_music/common/widgets/button/basic_app_button.dart';
import 'package:our_music/core/configs/assets/app_vectors.dart';
import 'package:our_music/core/configs/theme/app_colors.dart';
import 'package:our_music/data/models/auth/sign_in_user_req.dart';
import 'package:our_music/presentation/auth/pages/sign_up.dart';

import '../../../domain/usecases/auth/sign_in.dart';
import '../../../service_locator.dart';
import '../../root/pages/root.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

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
      bottomNavigationBar: _signUpText(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 60.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _registerText(),
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
                    var result = await sl<SignInUseCase>().call(
                      params: SignInUserReq(
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
                                const RootPage(),
                          ),
                          (route) => false,
                        );
                      },
                    );
                  },
                  title: "Enter",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      cursorColor: AppColors.primary,
      decoration: const InputDecoration(hintText: "Enter E-mail or Username")
          .applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      cursorColor: AppColors.primary,
      decoration: const InputDecoration(hintText: "Password").applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not a member?",
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
                  builder: (BuildContext context) => SignUpPage(),
                ),
              );
            },
            child: const Text(
              "Register Now",
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
