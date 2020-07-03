import 'package:edufy/constants.dart';
import 'package:edufy/ui/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String Function(String) validator;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        inputFormatters: [
          WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9]'))
        ],
        validator: validator,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
