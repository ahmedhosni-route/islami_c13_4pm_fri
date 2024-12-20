import 'package:flutter/material.dart';
import 'package:islami_4pm_fri/screens/layout/layout_screen.dart';
import 'package:islami_4pm_fri/screens/layout/quran/sura_details.dart';
import 'package:islami_4pm_fri/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LayoutScreen.routeName: (context) => LayoutScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
