import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/components/input_container.dart';


class RoundedPassWordInput extends StatelessWidget {
  const RoundedPassWordInput({super.key, required this.hint, required this.icon,});
  final String hint;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: Theme.of(context).colorScheme.primary,
        obscureText: true,
        decoration:  InputDecoration(
          icon: Icon(icon),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}