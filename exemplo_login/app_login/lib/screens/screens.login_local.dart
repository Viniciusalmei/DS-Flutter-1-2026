import 'package:app_login/screens/screens.home.dart';
import 'package:flutter/material.dart';

class TelaLoginLocal extends StatefulWidget {
  const TelaLoginLocal({super.key});

  @override
  State<TelaLoginLocal> createState() => _TelaLoginLocalState();
}

class _TelaLoginLocalState extends State<TelaLoginLocal> {

  TextEditingController nomeDigitado = TextEditingController();
  TextEditingController senhaDigitada = TextEditingController();
  List<Map<String, String>> usuarios = [
    {"nome": "joao", "senha": "123"},
    {"nome": "maria", "senha": "123"},
  ];


  void fazerLogin() {
  bool estaLogado = false;

    for (final usuario in usuarios) {
      if (usuario["nome"] == nomeDigitado.text &&
          usuario["senha"] == senhaDigitada.text) {
        estaLogado = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaHome()),
        );
      }
    }
    if (estaLogado == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Dados incorretos, tente novamente!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("App Login Local")),
      body: Center(child: 
      Column(
        children: [
          Icon(Icons.person,size: 100),
          TextField(controller: nomeDigitado,),
          TextField(controller: senhaDigitada),
          TextButton(onPressed: fazerLogin, child: Text("Logar"))
        ],
      )),
    );
  }
}