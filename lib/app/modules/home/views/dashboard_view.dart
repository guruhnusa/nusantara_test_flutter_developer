import 'package:flutter/material.dart';
import 'package:nusantara_test_flutter_developer/app/modules/home/views/home_view.dart';
import 'package:nusantara_test_flutter_developer/app/modules/home/widgets/navbar_menu.dart';
import 'package:nusantara_test_flutter_developer/app/modules/profile/views/profile_view.dart';
import 'package:nusantara_test_flutter_developer/app/core/assets/assets.gen.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 0;

  void navigateToPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const HomeView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavMenu(
              iconPath: Assets.images.navigation.home.path,
              label: 'Home',
              isActive: selectedIndex == 0,
              onPressed: () => navigateToPage(0),
            ),
            NavMenu(
              iconPath: Assets.images.navigation.profile.path,
              label: 'Profile',
              isActive: selectedIndex == 1,
              onPressed: () => navigateToPage(1),
            ),
          ],
        ),
      ),
    );
  }
}
