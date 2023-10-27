import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
  final formKey = GlobalKey<FormState>();

  int? sexo;
  double altura = 0 ;
  double peso   = 0;
  String name   = '';
  String phoneNumber = '';
  String empresa = '';
  String rua    = '';
  String bairro = '';
  String numero = '';
  
  @override
  Widget build(BuildContext context) {
    double pesoIdeal;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Form(
        key: formKey,
        child: Stepper(
          currentStep: _index,
          type: StepperType.horizontal,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index < 1) {
              if (formKey.currentState!.validate()) {
                setState(() {
                  _index += 1;
                });
              }
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              title: const Text('Credenciais'),
              state: _index > 0 ? StepState.complete : StepState.indexed,
              content: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor preencha este campo';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.people_rounded),
                        hintText: "Coloque o seu nome",
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor preencha este campo';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone_android),
                        border: OutlineInputBorder(),
                        hintText: "Número de Telefone",
                      ),
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Step(
              title: const Text('Endereço'),
              state: _index > 1 ? StepState.complete : StepState.indexed,
              content: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.add_location),
                        hintText: "Bairro",
                      ),
                      onChanged: (value) => bairro = value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.streetview),
                        hintText: "Rua",
                      ),
                      onChanged: (value) => rua = value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(),
                        hintText: "Número",
                      ),
                      onChanged: (value) => numero = value,
                    ),
                  ],
                ),
              ),
            ),
            Step(
              title: const Text('Adicionais'),
              state: _index > 2 ? StepState.complete : StepState.indexed,
              content: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.work),
                        hintText: "Empresa",
                      ),
                      onChanged: (value) => empresa = value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor preencha este campo';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.line_weight),
                        border: OutlineInputBorder(),
                        hintText: "Peso",
                      ),
                      onChanged: (value) {
                        setState(() => peso = double.parse(value));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor preencha este campo';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.height),
                        border: OutlineInputBorder(),
                        hintText: "Altura",
                      ),
                      onChanged: (value) {
                        setState(() => altura = double.parse(value));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: const Text('Homem'),
                                  leading: Radio<int>(
                                    value: 0,
                                    groupValue: sexo,
                                    onChanged: (int? value) {
                                      setState(() => sexo = value);
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text("Mulher"),
                                  leading: Radio<int>(
                                    value: 1,
                                    groupValue: sexo,
                                    onChanged: (int? value) {
                                      setState(() {
                                        sexo = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ElevatedButton(
          onPressed: () => {
            if (sexo == 0) {
              pesoIdeal = (72.7 *  altura - 58),
            } else {
              pesoIdeal = (62.1 * altura - 58),
            },
            if (formKey.currentState!.validate()) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Informações'),
                  content: Text('Pessoais: \nAltura: $altura, Peso: $peso Sexo: $sexo\n Peso Ideal: $pesoIdeal\n\n'
                                'Endereço: \n Bairro: $bairro, Rua: $rua, Número $numero\n\n'
                                'Contato: \nNome: $name, Telefone: $phoneNumber\n\n'
                                'Empresa: \nNome: $empresa   '),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            }
          },
          child: const Text('Enviar'),
        ),
      ),
    );
  }
}
