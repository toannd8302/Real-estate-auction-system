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
    double screenWidth = MediaQuery.of(context).size.width;

    return CustomScafford(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.05,
                horizontal: screenWidth * 0.1,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Real Estate',
                    style: TextStyle(
                      fontSize: 0.07 * screenWidth, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '\nAuction System',
                        style: TextStyle(
                          fontSize: 0.07 * screenWidth, // Responsive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.1,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: WelcomeButton(
                        buttonText: "Sign in",
                        onTap: LoginScreen(),
                        color: Colors.transparent,
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Add some spacing between buttons
                    Expanded(
                      child: WelcomeButton(
                        buttonText: "Sign up",
                        onTap: SignUpScreen(),
                        color: Colors.white,
                        textColor: lightColorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
