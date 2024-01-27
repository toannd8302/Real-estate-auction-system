import 'package:flutter/material.dart';
import 'package:real_estate_auction_system/components/input_container.dart';

class RoundedInput extends StatefulWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.errorText,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final String errorText;

  @override
  RoundedInputState createState() => RoundedInputState();
}

class RoundedInputState extends State<RoundedInput> {
  TextEditingController _controller = TextEditingController();
  bool _nameInValidated = false;

  bool validate() {
    setState(() {
      if (_controller.text.isEmpty) {
        _nameInValidated = true;
      }
      // else if (_controller.text.length < 6 || !_controller.text.contains('@')) {
      //   _nameInValidated = true;
      // }
      else {
        _nameInValidated = false;
      }
    });
    return _nameInValidated;
  }

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: Theme.of(context).colorScheme.primary,
        controller: _controller,
        onChanged: (value) {
          validate(); // Gọi hàm validate khi người dùng thay đổi giá trị
        },
        decoration: InputDecoration(
          errorText: _nameInValidated ? widget.errorText : null,
          icon: Icon(widget.icon),
          hintText: widget.hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
