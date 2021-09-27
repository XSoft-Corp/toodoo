import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toodoo/custom_widgets/custom_button.dart';
import 'package:toodoo/custom_widgets/custom_field.dart';

class RegistrationScreen extends StatefulWidget {

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  String email;
  String password;
  String username;
  bool showSpinner = false;



  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: "logo",
                  child: Center(
                    child: Text(
                      "TooDoo",
                      style: TextStyle(
                        fontSize: 90.0,
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomField(
                  hint: "Enter your mail address",
                  isPassword: false,
                  validator: (String value){
                    if( !(value.toLowerCase().contains(".com") && value.toLowerCase().contains("@")) ){
                      return("Wrong mail address");
                    };
                  }
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomField(
                  hint: "Enter your password (at least 6 characters)",
                  validator: (String value){
                    if( value.length < 6 ){
                      return("come on, add ${6-value.length} more chars :)");
                    }
                  },
                  isPassword: true,
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomField(
                  isPassword: false,
                  hint: "Enter your username",
                  validator: (String value){
                    if( value.length > 12 ){
                      return("Username most not exceed 12 characters");
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomButton(
                  title: "Register",
                  colour: Colors.cyanAccent,
                  callback: (){},
                )


              ],
            ),
          ),
        ),

      ),
      inAsyncCall: showSpinner ,
    );
  }
}