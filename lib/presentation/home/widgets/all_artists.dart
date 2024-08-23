import 'package:flutter/material.dart';
import 'package:our_music/core/configs/assets/app_images.dart';

class AllArtists extends StatelessWidget {
  const AllArtists({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(54),
                        child: Image.asset(
                          AppImages.arianaGrande,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "Ariana Grande",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(54),
                        child: Image.asset(
                          AppImages.brunoMars,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "Bruno Mars",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(54),
                        child: Image.asset(
                          AppImages.theWeeknd,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "The Weknd",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(54),
                        child: Image.asset(
                          AppImages.slipknot,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "Slipknot",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(54),
                        child: Image.asset(
                          AppImages.seanPaul,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "Sean Paul",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(54),
                        child: Image.asset(
                          AppImages.marshmello,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "Marshmello",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
