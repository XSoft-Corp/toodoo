import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final bool isPassword;
  final String hint;
  final Function validator;
  final Function callback;

  CustomField({this.isPassword, this.hint, this.validator, this.callback});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      onChanged: callback,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      keyboardType:
          !isPassword ? TextInputType.emailAddress : TextInputType.text,
      obscureText: isPassword,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.all(9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))
        ),
        hintStyle: TextStyle(color: Colors.blueGrey),
        hintText: hint,
      ),
    );
  }
}
