import 'dart:convert';


class Filmes {

  late String nome;
  late String imagem;
  late String sinopse;
  late double rate;
  late String duracao;
  late String idade;

  Filmes(){
    nome ="";
    imagem = "";
    sinopse = "";
    rate = 0.0;
    duracao = "";
    idade = "";
  }
  Filmes.v(this.nome, this.imagem, this.sinopse, this.rate, this.duracao, this.idade);

  Filmes.fromJson(Map<String, dynamic> json)
  : nome = json['nome'] as String,
  imagem = json['imagem'] as String,
  sinopse = json['sinopse'] as String,
  rate = json['rate'] as double,
  duracao = json['duracao'] as String,
  idade = json['idade'] as String;


  Map<String, dynamic> toJson() => {
    'nome' : nome,
    'imagem' : imagem,
    'sinopse' : sinopse,
    'rate' : rate,
    'duracao' : duracao,
    'idade' : idade

  };
}
 