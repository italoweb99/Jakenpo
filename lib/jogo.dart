import 'package:flutter/material.dart';
//import 'packege:flutter/material.dart'
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imagemApp = AssetImage("images/padrao.png");
  var res = 'Boa sorte';
  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var num = Random().nextInt(3);
    var escolhaApp = opcoes[num];
    print("Escolha do usuario: " + escolhaUsuario);
    print("Escolha do App: " + escolhaApp);
    setState(() {
      imagemApp = AssetImage('images/' + escolhaApp + '.png');
    });
    if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura ' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        res = "Você Venceu";
      });
    } else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura ' && escolhaUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra')) {
      setState(() {
        res = "Você Perdeu";
      });
    } else {
      setState(() {
        res = "empate";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Jokenpo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => opcaoSelecionada('pedra'),
                  child: const Image(
                    image: AssetImage('images/pedra.png'),
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionada('papel'),
                  child: const Image(
                    image: AssetImage('images/papel.png'),
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionada('tesoura'),
                  child: const Image(
                    image: AssetImage('images/tesoura.png'),
                    height: 100,
                  ),
                ),
              ]),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              res,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
