import 'package:flutter/material.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});
  static const  String routeName = "/home";

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: const Center(
        child: Text("Home Screen"),
      ),
    );
  }
}