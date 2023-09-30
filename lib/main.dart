import 'package:flutter/material.dart';

void main() {
  runApp(ExemploInicial());
}

class ExemploInicial extends StatelessWidget {

  Widget build(BuildContext context) {
    final perguntas = ['Você possui CNH?', 'Você possui carro?'];
    return MaterialApp(
      home: Scaffold (
        appBar: AppBar(
          title: const Text('tester'),
        ),
        body: Column (
          children: [
            Row(children: [
            Text(perguntas[0]),
            const ElevatedButton(onPressed: null, child: Text('Sim')),
            const ElevatedButton(onPressed: null, child: Text('Não')),
          ],)
        ],)
            
          
      ),
    );
  }
}
