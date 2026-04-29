import 'package:app_login/navigation/navigation.navbar.dart';
import 'package:app_login/screens/screen.loginapi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavBar()
    );
  }
}