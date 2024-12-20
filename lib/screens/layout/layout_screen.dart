import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_4pm_fri/core/constant/app_assets.dart';
import 'package:islami_4pm_fri/core/theme/app_colors.dart';
import 'package:islami_4pm_fri/screens/layout/hadth/hadeth_screen.dart';
import 'package:islami_4pm_fri/screens/layout/quran/quran_screen.dart';
import 'package:islami_4pm_fri/screens/layout/widgets/bottm_nav_item.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "layout";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          backgroundColor: AppColors.whiteCoffee,
          fixedColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: BottmNavItem(
                    image: AppAssets.quranIcon, isSelected: selectedIndex == 0),
                label: "Quran"),
            BottomNavigationBarItem(
                icon: BottmNavItem(
                    image: AppAssets.hadethIcon,
                    isSelected: selectedIndex == 1),
                label: "Hadeth"),
            BottomNavigationBarItem(
                icon: BottmNavItem(
                    image: AppAssets.sebhaIcon, isSelected: selectedIndex == 2),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: BottmNavItem(
                    image: AppAssets.radioIcon, isSelected: selectedIndex == 3),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: BottmNavItem(
                    image: AppAssets.adhanIcon, isSelected: selectedIndex == 4),
                label: "Adhan"),
          ]),
      body: screens[selectedIndex],
    );
  }
}
