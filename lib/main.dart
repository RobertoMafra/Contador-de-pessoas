import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Contador de pessoas",
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _quant_pessoas = 0;
  String _lotacao = "Pode entrar!";

  int mudarPessoas(int valor) {
    setState(() {
      _quant_pessoas += valor;
    });
  }

  String verificarPessoas(int valor) {
    setState(() {
      if (valor >= 10) {
        _lotacao = "Restaurante Cheio!";
      } else if (valor >= 0 && valor < 10) {
        _lotacao = "Pode entrar!";
      } else {
        _lotacao = "Mundo inverso?";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_quant_pessoas",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                      onPressed: () {
                        mudarPessoas(1);
                        verificarPessoas(_quant_pessoas);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    onPressed: () {
                      mudarPessoas(-1);
                      verificarPessoas(_quant_pessoas);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _lotacao,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none),
            )
          ],
        ),
      ],
    );
  }
}//fim
