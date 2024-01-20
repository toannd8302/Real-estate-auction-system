import 'dart:ffi' as ffi;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_auction_system/components/register_form.dart';
import 'package:real_estate_auction_system/components/roudned_password.dart';

import 'package:real_estate_auction_system/components/rounded_button.dart';
import 'package:real_estate_auction_system/components/rounded_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = const Duration(milliseconds: 270);
  int _activeStepIndex = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
    name = TextEditingController();
    email = TextEditingController();
    pass = TextEditingController();
    address = TextEditingController();
    pincode = TextEditingController();
  }

  @override
  void dispose() {
    animationController.dispose();
    name.dispose();
    email.dispose();
    pass.dispose();
    address.dispose();
    pincode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Todo: get keyboard height
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);
    containerSize =
        Tween<double>(begin: size.height * 0.2, end: defaultLoginSize)
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: isLogin ? 0.0 : 1.0,
            duration: animationDuration,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.1,
                alignment: Alignment.bottomCenter,
                color: Theme.of(context).colorScheme.onBackground,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    animationController.reverse();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: isLogin ? 1.0 : 0.0,
            duration: animationDuration * 4,
            child: Visibility(
              visible: isLogin,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    height: defaultLoginSize,
                    color: Theme.of(context).colorScheme.background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/main");
                          },
                          child: Container(
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        const RoundedInput(
                          icon: Icons.mail,
                          hint: "Email",
                        ),
                        const RoundedPassWordInput(
                          hint: "Password",
                          icon: Icons.lock,
                        ),
                        const RoundedButton(title: "LOGIN"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          //Todo: Register Container
          AnimatedBuilder(
            builder: (context, child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }
              return Container();
            },
            animation: animationController,
          ),
          AnimatedOpacity(
            opacity: isLogin ? 0.0 : 1.0,
            duration: animationDuration * 5,
            child: Visibility(
              visible: !isLogin,
              child: RegisterSection(
                activeStepIndex: _activeStepIndex,
                onStepContinue: () {
                  if (_activeStepIndex < 2) {
                    setState(() {
                      _activeStepIndex += 1;
                    });
                  } else {
                    if (name.text.isNotEmpty &&
                        email.text.isNotEmpty &&
                        pass.text.isNotEmpty &&
                        address.text.isNotEmpty &&
                        pincode.text.isNotEmpty) {
                      print('Submitted');
                    } else {
                      print('Please fill in all fields');
                    }
                  }
                },
                onStepCancel: () {
                  if (_activeStepIndex > 0) {
                    setState(() {
                      _activeStepIndex -= 1;
                    });
                  }
                },
                onStepTapped: (int index) {
                  setState(() {
                    _activeStepIndex = index;
                  });
                },
                nameController: name,
                emailController: email,
                passController: pass,
                addressController: address,
                pincodeController: pincode,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          color: Theme.of(context).colorScheme.background,
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isLogin = !isLogin;
              animationController.forward();
            });
          },
          child: isLogin
              ? Text(
                  "Dont't have an account? Sign up",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
