import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  //Faça a sua lógica Aqui 
  String resultado = "";

  void fazerGet() async { //Funcao assincrona pois espera o resultado da
  //requisição/servidor
  //final é uma variavel que aguarda receber um valor
  //Uri é usado para decifrar requisições da url  
  final respostaServidor = await http.get(Uri.parse("https://json-serverds18.onrender.com/tasks"));

  //Se a resposta do servidor for 200
  //Decodifico a resposta
  //Atrelo o valor a variavel resultado
  if(respostaServidor.statusCode == 200){
    final dados = jsonDecode(respostaServidor.body);

    setState(() {
      resultado = dados[0]["title"];
    });
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Tela Get")),
        body: Center(
          child: Column(
            children: [
              Text(resultado),
              TextButton(onPressed: fazerGet, child: Text("Fazer Get"))
            ],
          )
        ),
    );
  }
}