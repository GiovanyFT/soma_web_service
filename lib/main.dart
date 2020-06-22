import 'package:flutter/material.dart';
import 'package:somawebservice/services/soma_service.dart';
import 'package:somawebservice/tabs/tab_cep.dart';
import 'package:somawebservice/tabs/tab_posts.dart';
import 'package:somawebservice/tabs/tab_posts2.dart';
import 'package:somawebservice/tabs/tab_soma.dart';
import 'package:somawebservice/widget/botao_azul.dart';
import 'package:somawebservice/widget/campo_edicao_double.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: HomePage(),
  );
}
}

// Precisei colocar como StatefulWidget ao invés de StatelessWidget
// para que a última aba não recarregue os dados todas as vezes que for acessada
// ou seja, para que ela armazene em memória os dados obtidos anterioremente
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Esse "with SingleTickerProviderStateMixin<HomePage>" vai ser usado para não recarregar
// os dados da aba "Sem botão"
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Soma Web Service"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Soma",
                ),
                Tab(text: "CEP"),
                Tab(text: "Com botão"),
                Tab(text: "Sem botão"),
              ],
            ),
          ),
          body: Builder(builder: (context) {
            return TabBarView(
              children: <Widget>[
                TabSoma(),
                TabCep(),
                TabPosts(),
                TabPosts2(),
              ], //await _buildSomaService(),
            );
          }),
        ),
    );
  }
}
