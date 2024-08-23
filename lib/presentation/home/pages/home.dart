import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_music/common/helpers/is_dark_theme.dart';
import 'package:our_music/core/configs/assets/app_images.dart';
import 'package:our_music/core/configs/theme/app_colors.dart';
import 'package:our_music/presentation/home/widgets/all_artists.dart';
import 'package:our_music/presentation/home/widgets/play_list.dart';
import 'package:our_music/presentation/profile/pages/profile.dart';

import '../../../common/widgets/appBar/app_bar.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBackButton: true,
        action: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const ProfilePage(),
              ),
            );
          },
          icon: const Icon(
            Icons.person,
          ),
        ),
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 148.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _homeCard(),
            _tabs(),
            SizedBox(
              height: 260.0,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  NewsSongs(),
                  AllArtists(),
                  //   Container(),
                  //   Container(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: PlayList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeCard() {
    return Center(
      child: SizedBox(
        height: 140.0,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                AppVectors.homeTopCard,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 60.0,
                ),
                child: Image.asset(
                  AppImages.slash,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 16.0,
      ),
      dividerHeight: 0,
      tabs: const [
        Tab(
          child: Text(
            "Suggested",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Tab(
          child: Text(
            "Artists",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        // Tab(
        //   child: Text(
        //     "Songs",
        //     style: TextStyle(
        //       fontWeight: FontWeight.w500,
        //       fontSize: 16,
        //     ),
        //   ),
        // ),
        // Tab(
        //   child: Text(
        //     "Albums",
        //     style: TextStyle(
        //       fontWeight: FontWeight.w500,
        //       fontSize: 16,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
