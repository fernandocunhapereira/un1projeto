import 'dart:math';
import 'package:flutter/material.dart';
import 'package:un1projeto/components/usuario_item.dart';
import 'package:un1projeto/data/my_data.dart';
import 'package:un1projeto/models/tarefa.dart';
import 'package:un1projeto/models/usuario.dart';
import 'package:un1projeto/utils/app_routes.dart';
import '../models/projeto.dart';
import 'package:un1projeto/data/globals.dart' as globals;

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

  final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;
  Usuario usuarioSelecionado = Usuario(id: 0, nome: 'sem nome', email: 'sem email');

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
                        _selecionarUsuario;
                        print('clicou');

                      },
                      child: ListView.builder(
                        //itemCount: usuarioItem.length,
                        //itemCount: DUMMY_USUARIOS.length,
                        itemCount: globals.listaUsuariosGlobal.length,
                        itemBuilder: (ctx, index) {
                          //return UsuarioItem(usuarioItem[index]);
                          //return UsuarioItem(DUMMY_USUARIOS[index]);
                          return UsuarioItem(globals.listaUsuariosGlobal[index]);
                        },
                      ),
                    ),
                  ),
                ),
        //pegar o usuario que foi clicado
        Text('Usuario selecionado: ' + globals.listaUsuariosGlobal[globals.listaUsuariosGlobal.length - 1].nome),

        ElevatedButton(onPressed: salvarTarefa, child: Text('Salvar'))
      ]),
    );
  }

  _selecionarUsuario(){
    
  }

  salvarTarefa() {
    Tarefa novaTarefa = Tarefa(
        id: Random().nextInt(9999),
        descricao: _tarefaControllerDescricao.text,
        usuario: globals.listaUsuariosGlobal[globals.listaUsuariosGlobal.length - 1] //pegar o usuario que foi clicado
      );
      //projeto.tarefas.add(novaTarefa); //adicionar a tarefa criada ao projeto que veio no argument
    Navigator.pop(context, novaTarefa);
  }
}