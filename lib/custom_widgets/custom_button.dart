import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final Function callback;
  final Color colour;

  CustomButton({this.colour, this.title, this.callback});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      elevation: 5.0,
      onPressed: callback,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,

        ),

      ),
      color: colour,


    );
  }
}
