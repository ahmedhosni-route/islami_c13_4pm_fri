import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_4pm_fri/core/constant/app_assets.dart';
import 'package:islami_4pm_fri/core/theme/app_colors.dart';
import 'package:islami_4pm_fri/screens/layout/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          const Spacer(),
          Center(
              child: ZoomIn(
                  duration: const Duration(seconds: 3),
                  onFinish: (direction) {
                    Navigator.pushReplacementNamed(
                        context, LayoutScreen.routeName);
                  },
                  child: Image.asset(AppAssets.islamiLogo))),
          const Spacer(),
          FadeInUp(child: Image.asset(AppAssets.routeLogo))
        ],
      ),
    );
  }
}
