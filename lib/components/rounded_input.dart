import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/components/input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({super.key, required this.icon, required this.hint});
  final String hint;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
