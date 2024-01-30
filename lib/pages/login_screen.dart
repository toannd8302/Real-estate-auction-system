import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/core/constants/color_constants.dart';
import 'package:real_estate_auction_system/pages/main_screen.dart';
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

  Future<void> loginUser() async {
    print("Iam in login fuction");
    final url =
        Uri.parse('https://swdprojectapi.azurewebsites.net/api/User/login');
    final body = jsonEncode({
      'username': usernameController.text,
      'password': passwordController.text,
    });
    print(usernameController.text + "||||" + usernameController.text);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'text/plain',
        },
        body: body,
      );
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        final userInfo = data['userInfo'];

        // Handle successful login, save token and user info to use in the app
        print('Login Successful!');
        print('Token: $token');
        print('User Info: $userInfo');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else if (response.statusCode == 400) {
        // Handle bad request (e.g., invalid credentials)
        print('Bad Request: ${response.body}');
      } else {
        // Handle other errors
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
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
                        hintStyle: TextStyle(
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
                    Container(
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
                              loginUser();
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
