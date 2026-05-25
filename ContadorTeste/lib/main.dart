import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage()
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0; 
  
  void add() {
    setState(() {
      contador++;
    });
  }

  void menus() {
    setState(() {
      contador--;
    });
  }

  void reset() {
    setState(() {
      contador = 0; 

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(contador.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: add, child: Icon(Icons.add)),
              TextButton(onPressed: menus, child: Icon(Icons.remove)),
              TextButton(onPressed: reset, child: Icon(Icons.restore))
            ],
          )
        ],
      ),
    );
  }
}