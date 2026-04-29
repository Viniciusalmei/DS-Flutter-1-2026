import 'package:apptarefas/screens/screens.local.dart';
import 'package:apptarefas/screens/screens.teladelete.dart';
import 'package:apptarefas/screens/screens.telaget.dart';
import 'package:apptarefas/screens/screens.telapost.dart';
import 'package:apptarefas/screens/screens.telaput.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //Faça a sua lógica aqui 
  int indexAtual = 0; //variavel para ver qual tela está selecionada

  List pages = [ //Lista para armazenar as paginas
    TelaGet(),
    TelaDelete(),
    TelaPost(),
    TelaPut(),
    TelaLocal()
  ];

  void mudarIndex(int novoIndex){ //Funcao para mudar a tela 
    setState(() {
      indexAtual = novoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(indexAtual),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //Permite ter mais de 3 itens na navbar
        items: [
        BottomNavigationBarItem(icon:Icon(Icons.get_app),label: "Get"),
        BottomNavigationBarItem(icon:Icon(Icons.delete),label: "Delete"),
        BottomNavigationBarItem(icon:Icon(Icons.post_add),label: "Post"),
        BottomNavigationBarItem(icon:Icon(Icons.edit),label: "Put"),
        BottomNavigationBarItem(icon:Icon(Icons.local_activity),label: "Local")
      ],
      currentIndex: indexAtual,
      onTap: mudarIndex,
      ),

    );
  }
}