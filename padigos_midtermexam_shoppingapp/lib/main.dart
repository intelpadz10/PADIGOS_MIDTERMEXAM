import 'package:flutter/material.dart';
import 'package:padigos_midtermexam_shoppingapp/service_locators.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
  setupLocators();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
