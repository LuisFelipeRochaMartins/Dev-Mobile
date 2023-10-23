import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Contatos',
    initialRoute: '/',
    theme: ThemeData.dark(),
    routes: {
      '/'        : (context) => const Contatos(),
      '/cadastro': (context) => const Cadastro(),
    },
  ));
}

class Contatos extends StatelessWidget {
  const Contatos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_call),
            tooltip: "Adicionar novo Contato",
            onPressed: (() => Navigator.pushNamed(context, '/cadastro')),
          ),
        ],
      ),
    );
  }
}

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Stepper(
        currentStep: _index,
        type: StepperType.vertical,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 0) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
            title: const Text('Ola '),
            content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Testing'),
            ),
          ),
          const Step(
            title: Text('Step 2 title'),
            content: Text('Content for Step 2'),
          ),
        ],
      ),
    );
  }
}
