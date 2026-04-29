import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaLocal extends StatefulWidget {
  const TelaLocal({super.key});

  @override
  State<TelaLocal> createState() => _TelaLocalState();
}

class _TelaLocalState extends State<TelaLocal> {
  List<String> items = [];
  TextEditingController valorDigitado = TextEditingController();
  @override 
  void initState() {
    super.initState();
    carregarDados(); 
  }

  void carregarDados() async {
    final dados = await SharedPreferences.getInstance();//variavel dados espera o banco 
    //iniciar
    setState(() {
      items = dados.getStringList('nomes') ?? []; //?? Se não tiver nada na gaveta de nomes a minha lista é vazia
    });
  }

  void criarDados() async {
    final dados = await SharedPreferences.getInstance(); 
    setState(() {
      items.add(valorDigitado.text);
    });

    await dados.setStringList('nomes', items);
    carregarDados();
  }

  void deletarDados(int index) async {
    final dados = await SharedPreferences.getInstance(); 
    setState(() {
      items.removeAt(index);
    });
    await dados.setStringList('nomes', items);
    carregarDados();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Armazenamento Local")),
      body: ListView(
        children: [
          TextField(controller: valorDigitado),
          TextButton(onPressed: criarDados, child: Text("Criar Dado")),
          for(final nome in items)
          Card(
            child: ListTile(
              leading: Text(nome),
              trailing: GestureDetector(
                onTap:() => deletarDados(items.indexOf(nome)),
                child: Icon(Icons.remove)
              ),
            )
          )
        ],
      )
    );
  }
}