import 'package:flutter/material.dart';
import 'package:toodoo/task_stuff/models/task_data.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=> TaskData(),
      child: MaterialApp(
        routes: {
          "/" : (context)=> WelcomeScreen(),
          "/login": (context)=> LoginScreen(),
          "/register": (context)=> RegistrationScreen(),
          "/tasksScreen" : (context)=> TasksScreen(),

        },
        initialRoute: "/",


      ),
    );
  }
}

