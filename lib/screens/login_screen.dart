import 'package:flutter/material.dart';
import 'package:toodoo/custom_widgets/custom_field.dart';
import 'package:toodoo/custom_widgets/custom_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toodoo/screens/task_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String password;
  String email;
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
                          color: Colors.cyan
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomField(
                  isPassword: false,
                  hint: "Enter your mail address",
                  validator: (value){},
                  callback: (value){
                    email = value;

                  },

                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomField(
                  isPassword: true,
                  hint: "Enter your password",
                  validator: (value){},
                  callback: (value){
                    password = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  title: "Login",
                  colour: Colors.cyanAccent,
                  callback: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try{
                      final newLogin = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(newLogin != null){
                        setState(() {
                          showSpinner = false;
                          Navigator.popAndPushNamed(context, "/tasksScreen");
                        });
                      }

                    }catch(e){
                      return e;
                    }


                  },
                )

              ],
            ),
          ),
        ),

      ),
      inAsyncCall: showSpinner,
    );
  }
}