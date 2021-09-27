import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toodoo/custom_widgets/custom_button.dart';
import 'package:toodoo/custom_widgets/custom_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
                    if( !(value.toLowerCase().contains(".") && value.toLowerCase().contains("@")) ){
                      return("Wrong mail address");
                    };
                  },
                  callback: (value){
                    email = value;
                  },
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
                  callback: (value){
                    password = value;
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
                  callback: (value){
                    username = value;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomButton(
                  title: "Register",
                  colour: Colors.cyanAccent,
                  callback: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try{
                       final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                       if(newUser!=null){
                         setState(() {
                           showSpinner = false;
                         });
                         Navigator.popAndPushNamed(context, "/tasksScreen");
                       }
                    }catch(e){
                      print(e);
                    }
                  },
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