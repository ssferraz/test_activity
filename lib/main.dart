import 'package:flutter/material.dart';

import 'src/model/person.dart';
import 'src/widget/field_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cálculo de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();
  var idadeController = TextEditingController();
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();

  Future<void> _showMyDialog(Person person) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Text("Nome: ${person.name}"),
                  Text("É adulto? ${person.isOlder}"),
                  Text("IMC: ${person.imc}"),
                ],
              ),
            ),
          );
        });
  }

  void _calcImc() {
    setState(() {
      if (nameController.text.isNotEmpty &&
          idadeController.text.isNotEmpty &&
          alturaController.text.isNotEmpty &&
          pesoController.text.isNotEmpty) {
        var person = Person(
            name: nameController.text,
            age: int.parse(idadeController.text),
            height: double.parse(alturaController.text),
            weight: double.parse(pesoController.text));
        _showMyDialog(person);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Card(
        margin: const EdgeInsets.all(40),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FieldWidget(
                  text: 'Nome',
                  controller: nameController,
                  type: 1,
                ),
                FieldWidget(
                  text: 'Idade',
                  controller: idadeController,
                  type: 2,
                ),
                FieldWidget(
                  text: 'Altura',
                  controller: alturaController,
                  type: 2,
                ),
                FieldWidget(
                  text: 'Peso',
                  controller: pesoController,
                  type: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    _calcImc();
                  },
                  child: const Text('Calcular'),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
