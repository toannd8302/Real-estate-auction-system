import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/pages/home_screen.dart';
import 'package:real_estate_auction_system/pages/login_screen.dart';
import 'package:real_estate_auction_system/pages/signup_screen.dart';
import 'package:real_estate_auction_system/pages/welcome_screen.dart';
import 'package:real_estate_auction_system/pages/main_screen.dart';
import 'package:real_estate_auction_system/pages/profile_screen.dart';

final Map<String, WidgetBuilder> myRourtes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  // SplashScreen.routeName: (context) => const SplashScreen(),
  // IntroScreen.routeName: (context) => const IntroScreen(),
  HomeSreen.routeName: (context) => const HomeSreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
