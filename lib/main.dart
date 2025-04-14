import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'movies.dart';
import 'dart:convert';

void main() {
  runApp(const MaterialApp(title: "App", home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  List<dynamic> filmes = [];
   int total = 0; 
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/Movies.json');
     Iterable data = json.decode(response);
    
    setState(() {
      filmes = List<dynamic>.from(data.map((model) => Filmes.fromJson(model)));
      total = filmes.length;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return filmes.isEmpty
    ?
    const Center(child: CircularProgressIndicator()) 
    :
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Movies")),
        body: Center(
          child: Column(
            children: [
              Image(image: AssetImage(filmes[0].imagem)),
              ListTile(
              title: Text(filmes.isNotEmpty ? filmes[0].nome : "Nenhum filme encontrado"),),
              ListTile(leading: Image(image: AssetImage(filmes[1].imagem)),
              title: Text(filmes.isNotEmpty ? filmes[1].nome : "Nenhum filme encontrado"),
              subtitle: Text(filmes.isNotEmpty ? filmes[1].sinopse : "Nenhum filme encontrado"),),
              
              
            ],
          ),
        )
      ),
    );
  }
}
