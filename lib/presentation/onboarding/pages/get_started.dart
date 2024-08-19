import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_music/core/configs/theme/app_colors.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../choose_theme/page/choose_theme.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "User friendly mp3 music player for your device!",
      "vector": AppVectors.onboardingImageOne
    },
    {
      "text": "We provide a better audio experien than others!",
      "vector": AppVectors.onboardingImageTwo
    },
    {
      "text": "We show the easy way to hear musics. Just stay at home with us.",
      "vector": AppVectors.onboardingImageThree
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    vector: splashData[index]["vector"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.only(right: 5),
                            height: 6,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? AppColors.primary
                                  : AppColors.grey,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                      BasicAppButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ChooseThemePage(),
                            ),
                          );
                        },
                        title: "Get Started",
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashContent extends StatefulWidget {
  const SplashContent({
    super.key,
    this.text,
    this.vector,
  });
  final String? text, vector;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            AppVectors.logo,
            width: 196.0,
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          child: Text(
            widget.text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            widget.vector!,
            height: 200,
          ),
        ),
      ],
    );
  }
}
