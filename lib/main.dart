import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/results_screen/DoneProvider.dart';
import 'package:task/results_screen/ForgotPassword.dart';
import 'package:task/main_screens/LoginPage.dart';
import 'package:task/main_screens/RegisterPage.dart';
import 'results_screen/Done.dart';
import 'results_screen/Home.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //initilization of Firebase app
  // here, Firebase.initilizeApp() is Future method, so you need to add await before.
  //run time error: Unhandled Exception: [core/no-app] 
  //No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Abel'),
      home: const RegisterPage(),
      routes: <String, WidgetBuilder> {
      '/LoginPage': (BuildContext context) => const LoginPage(),
      '/RegisterPage': (BuildContext context) => const RegisterPage(),
      '/ForgotPassword': (BuildContext context) => ForgotPassword(),
      '/Done': (BuildContext context) => const Done(),
      '/DoneProvider': (BuildContext context) => DoneProvider(),
      '/Home': (BuildContext context) => Home(),

    },
    );
  }
}
