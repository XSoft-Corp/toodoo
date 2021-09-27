import 'package:flutter/material.dart';
import 'package:toodoo/custom_widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Center(
                child: Hero(
                  tag: "logo",
                  child: Text(
                    "TooDoo",
                    style: TextStyle(
                      fontSize: 80.0,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,

                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              CustomButton(
                title: "Login",
                colour: Colors.lightBlueAccent,
                callback: (){
                  Navigator.pushNamed(context, "/login");

                }  ,
              ),
              CustomButton(
                title: "Register",
                colour: Colors.lightBlue,
                callback: (){
                  Navigator.pushNamed(context, "/register");

                }  ,
              )



            ],
          ),
        ),
      ),
    );
  }
}
