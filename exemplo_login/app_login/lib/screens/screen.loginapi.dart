import 'dart:convert';

import 'package:app_login/screens/screens.home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaLoginAPI extends StatefulWidget {
  const TelaLoginAPI({super.key});

  @override
  State<TelaLoginAPI> createState() => _TelaLoginAPIState();
}

class _TelaLoginAPIState extends State<TelaLoginAPI> {
  TextEditingController nomeDigitado = TextEditingController();
  TextEditingController senhaDigitada = TextEditingController();
  
  List usuarios = [];

  @override
  void initState(){
    super.initState();
    fazerGet();
  } 

  void fazerGet () async{
    final respostaServidor = await http.get(Uri.parse("http://10.109.72.19:3000/users"));
    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
    setState(() {
      usuarios = dados;
    });
    }
  }

  void fazerLogin() async {
    bool estaLogado = false;
    for(final usuario in usuarios){
      if(usuario["nome"] == nomeDigitado.text && usuario["senha"] == senhaDigitada.text ){
        estaLogado = true;
        Navigator.push(context,MaterialPageRoute(builder: (context)=> TelaHome()));
      }
    }
    if(estaLogado == false){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Dados incorretos, tente novamente!")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("App Login API")),
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