import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/pages/home_screen.dart';
import 'package:real_estate_auction_system/pages/login_screen.dart';
import 'package:real_estate_auction_system/pages/main_screen.dart';

final Map<String, WidgetBuilder> myRourtes = {
   LoginScreen.routeName: (context) => const LoginScreen(),
  // SplashScreen.routeName: (context) => const SplashScreen(),
  // IntroScreen.routeName: (context) => const IntroScreen(),
   HomeSreen.routeName: (context) => const HomeSreen(),
  MainScreen.routeName: (context) => const MainScreen(),
};
