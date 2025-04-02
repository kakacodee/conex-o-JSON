import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'movies.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shake/shake.dart';
import 'dart:math';
import 'dart:convert';

void main() {
  runApp(const MaterialApp(title: "App",
      home: MainApp(),));
}
class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
    MainAppState createState() => MainAppState();
}
  class MainAppState extends State<MainApp> {
  List<Filmes> filmes = [];
  late ShakeDetector _detector;

  
 Future<void> readJson() async {
     final String response = await rootBundle.loadString('assets/Movies.json');
     Iterable data = await jsonDecode(response);
    setState(() {
      filmes =  List<Filmes>.from(data.map((model) => Filmes.fromJson(model)));
    });
 }
  @override
  void initState() {
    super.initState();
    readJson();
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Movies")),
        body: Center(
          child: filmes.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: filmes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filmes[index].nome),
                      subtitle: Text(filmes[index].sinopse),
                    );
                  },
                ),
        ),
      ),
    );
  }
}