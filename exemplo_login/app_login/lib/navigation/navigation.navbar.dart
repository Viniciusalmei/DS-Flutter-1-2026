import 'package:app_login/screens/screen.loginapi.dart';
import 'package:app_login/screens/screens.login_local.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0; 
  void mudarIndex (int novoIndex) {
    setState(() {
      currentIndex = novoIndex;
    });
  }

  List screens = [
    TelaLoginLocal(),
    TelaLoginAPI()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Login LOCAL"),
        BottomNavigationBarItem(icon: Icon(Icons.login),label: "Login API")
      ],
      currentIndex: currentIndex,
      onTap: mudarIndex,
      ),
    );
  }
}