import 'dart:math';
import 'package:flutter/material.dart';
import 'package:un1projeto/components/usuario_item.dart';
import 'package:un1projeto/data/my_data.dart';
import 'package:un1projeto/models/tarefa.dart';
import 'package:un1projeto/models/usuario.dart';
import 'package:un1projeto/utils/app_routes.dart';
import '../models/projeto.dart';

class TarefaCadastroScreen extends StatefulWidget {
  //void Function(Projeto) onSubmit;
  //final Projeto projeto;
  @override
  //State<ProjetoCadastroScreen> createState() => _ProjetoCadastroScreenState();
  State<TarefaCadastroScreen> createState() => _TarefaCadastroScreenState();
}

class _TarefaCadastroScreenState extends State<TarefaCadastroScreen> {
  final _tarefaControllerDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Tarefa'),
      ),
      body: Column(children: <Widget>[
        TextField(
          controller: _tarefaControllerDescricao,
          decoration: InputDecoration(labelText: 'Descricao da tarefa'),
        ),
        Text('Atribua um usuario a tarefa:'),
        Expanded(
          child: SizedBox(
          height: 200.0,
                    child: GestureDetector(
                      onTap: (){
                        //setar o usuario da lista a tarefa
                      },
                      child: ListView.builder(
                        //itemCount: usuarioItem.length,
                        itemCount: DUMMY_USUARIOS.length,
                        itemBuilder: (ctx, index) {
                          //return UsuarioItem(usuarioItem[index]);
                          return UsuarioItem(DUMMY_USUARIOS[index]);
                        },
                      ),
                    ),
                  ),
                ),

        ElevatedButton(onPressed: salvarTarefa, child: Text('Salvar'))
      ]),
    );
  }

  salvarTarefa() {
    /*Tarefa novaTarefa = Tarefa(
        id: Random().nextInt(9999),
        descricao: _tarefaControllerDescricao.text,
    Navigator.pop(context, novaTarefa);*/
  }
}