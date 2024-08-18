import 'package:flutter/material.dart';

import '../../../../core/configs/assets/app_vectors.dart';
import 'social_card.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocalCard(
              icon: AppVectors.socialBrandFacebook,
              press: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SocalCard(
                icon: AppVectors.socialBrandGoogle,
                press: () {},
              ),
            ),
            SocalCard(
              icon: AppVectors.socialBrandX,
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
