import 'package:apptarefas/navigation/navigation.navbar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Aqui voce coda a logica 
  @override //Garante que a função resete toda vez que iniciar o app
  void initState() { //Atribuir instruções no estado inicial da tela (carregamento)
  super.initState();
  Future.delayed(//Espera 2 segundos e depois realiza uma ação
  Duration(seconds: 2),
  (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
  }
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.task,size: 80),//
          Text("App Tasks do Vini"),
          Divider(indent: 20, endIndent: 20,),
          Text("Bem Vindo Ao App de Gerenciamento")
        ],
      )
      )
    );
  }
}