import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/components/input_container.dart';

class RoundedPassWordInput extends StatefulWidget {
  const RoundedPassWordInput({
    Key? key,
    required this.hint,
    required this.icon,
    required this.errorText,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final String errorText;

  @override
  RoundedPassWordInputState createState() => RoundedPassWordInputState();
}

class RoundedPassWordInputState extends State<RoundedPassWordInput> {
  bool _showPassword = false;
  TextEditingController _passwordController = TextEditingController();
  bool _passwordInvalidated = false;

  bool validate() {
    setState(() {
      _passwordInvalidated = _passwordController.text.isEmpty;
    });
    return _passwordInvalidated;
  }

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: _passwordController,
        onChanged: (value) {
          validate(); // Gọi hàm validate khi người dùng thay đổi giá trị
        },
        cursorColor: Theme.of(context).colorScheme.primary,
        obscureText: !_showPassword,
        decoration: InputDecoration(
          errorText: _passwordInvalidated ? widget.errorText : null,
          icon: Icon(widget.icon),
          hintText: widget.hint,
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
        ),
      ),
    );
  }
}
