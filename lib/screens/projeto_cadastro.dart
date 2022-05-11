import 'dart:math';

import 'package:flutter/material.dart';

import '../models/projeto.dart';

class ProjetoCadastroScreen extends StatefulWidget {
  //void Function(Projeto) onSubmit;
  //final Projeto projeto;
  @override
  State<ProjetoCadastroScreen> createState() => _ProjetoCadastroScreenState();
}

class _ProjetoCadastroScreenState extends State<ProjetoCadastroScreen> {
  final _projetoControllerTitulo = TextEditingController();

  final _projetoControllerDescricao = TextEditingController();

  final _projetoControllerPrazo = TextEditingController();

  DateTime _dataSelecionada = DateTime.now();

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2050))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      //return pickedDate;
      setState(() {
        _dataSelecionada = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Projeto'),
      ),
      body: Column(children: <Widget>[
        TextField(
          controller: _projetoControllerTitulo,
          decoration: InputDecoration(labelText: 'Título'),
        ),
        TextField(
          controller: _projetoControllerDescricao,
          decoration: InputDecoration(labelText: 'Descricao'),
        ),
        /*TextField(
          controller: _projetoControllerPrazo,
          decoration: InputDecoration(labelText: 'Prazo Entrega'),
        ),*/
        TextButton(onPressed: _showDatePicker, child: Text('Prazo Entrega')),
        ElevatedButton(onPressed: salvarProjeto, child: Text('Salvar'))
      ]),
    );
  }

  salvarProjeto() {
    Projeto novoProjeto = Projeto(
        id: Random().nextInt(9999),
        titulo: _projetoControllerTitulo.text,
        prazo: /*DateTime.now(),*/_dataSelecionada,
        descricao: _projetoControllerDescricao.text);
    Navigator.pop(context, novoProjeto);
  }
}
