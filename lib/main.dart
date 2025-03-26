import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'movies.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shake/shake.dart';
import 'dart:math';
import 'dart:convert';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
    MainAPP createState() => MainAPP();
}
  class MainAPP extends State<MainApp> {
  List<Filmes> filmes = List.empty();
  late ShakeDetector _detector;

  
 Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/Movies.json');
     Iterable data = await json.decode(response);
    setState(() {
      filmes =  List<Filmes>.from(data.map((model)=> Filmes.fromJson(model)));
    });
 }
  @override
  void initState() {
    super.initState();
    readJson();
  }
 

 

  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: filmes.isEmpty
          ? Text('Carregando filmes...')
          : Text(filmes[0].nome),
        ),
      ),
    );
  }
  }