import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/core/constants/color_constants.dart';
import 'package:real_estate_auction_system/pages/main_screen.dart';
import 'package:real_estate_auction_system/service/api_service.dart';
import 'package:real_estate_auction_system/widgets/custom_scafforld.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiService apiService = ApiService(httpClient: http.Client());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomScafford(
      child: Column(
        children: [
          const Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              )),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                width * 0.05,
                width *
                    0.05, // Adjusted padding from 50 to 5% of the screen width
                width * 0.05,
                width * 0.02,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Form(
                key: _formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        label: const Text("Username"),
                        hintText: "Enter Username",
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        //icon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        // else if (value.length < 6 || !value.contains('@')) {
                        //   _nameInValidated = true;
                        // }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        label: const Text("Password"),

                        hintText: "Enter password",
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        //icon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        // else if (value.length < 6 || !value.contains('@')) {
                        //   _nameInValidated = true;
                        // }
                        return null;
                      },
                    ),
                    Row(children: [
                      Checkbox(
                        value: rememberPassword,
                        onChanged: (value) {
                          setState(() {
                            rememberPassword = value!;
                          });
                        },
                      ),
                      Text("Remember me"),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text("Forgot password?"),
                      ),
                    ]),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formSignInKey.currentState!.validate() &&
                                rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                              Future<bool> checkLogin = apiService.loginUser(
                                  usernameController.text,
                                  passwordController.text);
                              checkLogin.then((value) {
                                if (value) {
                                  Navigator.pushNamed(context, "/main");
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Login Failed. Check your username and password'),
                                    ),
                                  );
                                }
                              });

                              // Navigator.pushNamed(context, "/main");
                              // } else if (!rememberPassword) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text('Please remember password'),
                              //     ),
                              //   );
                              // } else {
                            } else {}
                          },
                          child: const Text("Sign in")),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: const Divider(
                              thickness: 0.7,
                              color: Colors.black45,
                              height: 36,
                            ),
                          ),
                        ),
                        const Text("Or"),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: const Divider(
                              thickness: 0.7,
                              color: Colors.black45,
                              height: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/logos/google.png",
                          ),
                          Image.asset(
                            "assets/logos/facebook.png",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
