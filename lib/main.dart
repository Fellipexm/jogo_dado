import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiceApp(),
    );
  }
}

class DiceApp extends StatefulWidget {
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int _numeroSorteado = 1;
  Color _backgroundColor = Colors.white;

  void _jogarDado() {
    setState(() {
      _numeroSorteado = Random().nextInt(6) + 1;
      _backgroundColor = _gerarCorAleatoria();
    });
  }

  Color _gerarCorAleatoria() {
    return Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O jogo do felipao'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/dice$_numeroSorteado.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _jogarDado,
                child: Text('Jogar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
