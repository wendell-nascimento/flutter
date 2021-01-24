import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      backgroundColor: Colors.green,
    ),
    home: MeuApp1(),
  ));
}

class MeuApp1 extends StatefulWidget {
  @override
  _MeuApp1State createState() => _MeuApp1State();
}

class _MeuApp1State extends State<MeuApp1> {
  var _fraseGerada = "Clique abaixo para gerar uma mensagem";

  String alterarFrase() {
    var texto = "Nenhuma frase no momento";
    var textoAntigo =
        _fraseGerada; // guarda a última mensagem apresentada ao usuários

    var frases = [
      "Seja Feliz",
      "Encontre Jesus",
      "Construa sua paz na terra",
      "Trabalhe o suficente para não ter que trabalhar",
    ];

    int totalDeFrases = frases.length;

    var n = new Random();

    texto = frases[n.nextInt(totalDeFrases)]; //atualiza a frase gerada

    while (texto == textoAntigo) {
      //verifica a frase nova com a última apresentada
      print("Iguais");

      //caso a mensagem nova seja igual a antiga gero novamente a frase aleatória
      texto = frases[n.nextInt(totalDeFrases)];
    }

    return texto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          /*decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.black),
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                  child: Text(
                    "Nova Frase",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _fraseGerada = alterarFrase();
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }


}
