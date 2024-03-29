import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/core/constants/color_constants.dart';
import 'package:real_estate_auction_system/pages/login_screen.dart';
import 'package:real_estate_auction_system/widgets/custom_scafforld.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String routeName = "/signup";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  @override
  Widget build(BuildContext context) {
    //Local variable describe input decoration
    var inputDecorationEmail = InputDecoration(
      label: const Text('Email'),
      hintText: 'Enter Email',
      hintStyle: const TextStyle(
        color: Colors.black26,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    var inputDecorationFullName = InputDecoration(
      label: const Text('Full Name'),
      hintText: 'Enter Full Name',
      hintStyle: const TextStyle(
        color: Colors.black26,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    var inputDecorationPassword = InputDecoration(
      label: const Text('Password'),
      hintText: 'Enter Password',
      hintStyle: const TextStyle(
        color: Colors.black26,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    var inputDecorationComfirmPassword = InputDecoration(
      label: const Text('Comfirm Password'),
      hintText: 'Enter Password',
      hintStyle: const TextStyle(
        color: Colors.black26,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    var inputDecorationFirstName = InputDecoration(
      label: const Text('FirstName'),
      hintText: 'Enter FirstName',
      hintStyle: const TextStyle(
        color: Colors.black26,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    var inputDecorationLastName = InputDecoration(
      label: const Text('LastName'),
      hintText: 'Enter LastName',
      hintStyle: const TextStyle(
        color: Colors.black26,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12, // Default border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    //datOfBirth
    //gender
    //cityzenId
    return CustomScafford(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // full name
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full name';
                          }
                          return null;
                        },
                        decoration: inputDecorationFullName,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // email
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: inputDecorationEmail,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // password
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: inputDecorationPassword,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Confirm Password';
                          }
                          return null;
                        },
                        decoration: inputDecorationComfirmPassword,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter FirstName';
                          }
                          return null;
                        },
                        decoration: inputDecorationFirstName,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter LatsName';
                          }
                          return null;
                        },
                        decoration: inputDecorationLastName,
                      ),
                      // i agree to the processing
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary,
                          ),
                          const Text(
                            'I agree to the processing of ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Personal data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formSignupKey.currentState!.validate() &&
                                agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            } else if (!agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please agree to the processing of personal data')),
                              );
                            }
                          },
                          child: const Text('Sign up'),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up social media logo

                      const SizedBox(
                        height: 25.0,
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
