import 'package:edufy/constants.dart';
import 'package:edufy/ui/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String Function(String) validator;
  final TextInputType keyboardType;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon ,
    this.onChanged,
    this.validator, this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9]'))],
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
