import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/core/constants/demension_constatnt.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.title, this.onTap});

  //Todo: 2 proerties => title and onTap
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    //Todo: GestureDetector catch event  include onTap and UI
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
