import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");

  var _mensagem = "Escolha uma opção abaixo: ";

  _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("images/pedra.png");
        });

        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("images/tesoura.png");
        });
    }

    if (escolhaUsuario == "pedra" && escolhaApp == "tesoura" || escolhaUsuario == "tesoura" && escolhaApp == "papel" || escolhaUsuario == "papel" && escolhaApp == "pedra") {
      setState(() {
        _mensagem = "Você ganhou!! :) ";
      });
    } else if (escolhaApp == "pedra" && escolhaUsuario == "tesoura" || escolhaApp == "tesoura" && escolhaUsuario == "papel" || escolhaApp == "papel" && escolhaUsuario == "pedra") {
      setState(() {
        _mensagem = "Você perdeuu!! :( ";
      });
    }else {
      setState(() {
        _mensagem = "Empate :P ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: _imagemApp),


          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100,),),
              GestureDetector(onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100,),),
              GestureDetector(onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100,),),
              // ,
              // Image.asset("images/papel.png", height: 100,),
              // Image.asset("images/tesoura.png", height: 100,),
            ],
          )
        ],
      ),
    );
  }
}
