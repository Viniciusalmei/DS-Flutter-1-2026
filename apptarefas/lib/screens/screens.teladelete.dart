import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaDelete extends StatefulWidget {
  const TelaDelete({super.key});

  @override
  State<TelaDelete> createState() => _TelaDeleteState();
}

class _TelaDeleteState extends State<TelaDelete> {
  //Vamos codar a nossa lógica aqui 
  List listaApi = [];

  @override //Garante que o estado inicial sempre reinicie 
  void initState() { //Serve para rodar uma função ao abrir um tela
  super.initState(); //Garante que vai funcionar no estado inicial
  fazerGet();
  }

  void fazerGet() async {
    final respostaServidor = await http.get(Uri.parse("https://json-serverds18.onrender.com/tasks"));
    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        listaApi = dados;
      });
    }
  }

  void fazerDelete(final id) async {
    final respostaServidor = await http.delete(Uri.parse("https://json-serverds18.onrender.com/tasks/$id"));

    if(respostaServidor.statusCode == 200){
      fazerGet(); //Atualizo a minha tela

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Dado deletado com sucesso"))
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Delete")),
      body: ListView( //permite a rolagem de tela
      children: [
        for(final item in listaApi)
        Card(
          child: ListTile(
            leading: Text(item["title"]),
            trailing: GestureDetector(
              onTap: ()=> fazerDelete(item["id"]),
              child: Icon(Icons.delete),
            ),
          )
        ),
        Text("Voce chegou ao final da lista")
      ],
      )
    );
  }
}