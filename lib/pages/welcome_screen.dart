import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/core/constants/color_constants.dart';
import 'package:real_estate_auction_system/pages/login_screen.dart';
import 'package:real_estate_auction_system/pages/signup_screen.dart';
import 'package:real_estate_auction_system/widgets/custom_scafforld.dart';
import 'package:real_estate_auction_system/widgets/welcome_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static String routeName = "/";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScafford(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Real Estate',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        children: [
                          TextSpan(
                            text: '\nAuction System',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ))),
          Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    const Expanded(
                        child: WelcomeButton(
                      buttonText: "Sign in",
                      onTap: LoginScreen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    )),
                    Expanded(
                        child: WelcomeButton(
                      buttonText: "Sign up",
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
