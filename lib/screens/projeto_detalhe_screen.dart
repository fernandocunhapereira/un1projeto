import 'package:flutter/material.dart';
import 'package:un1projeto/screens/tarefa_cadastro_screen.dart';
import 'package:un1projeto/utils/app_routes.dart';

import '../components/tarefa_item.dart';
import '../data/my_data.dart';
import '../models/projeto.dart';

class ProjetoDetalheScreen extends StatelessWidget {
  //Country country;
  // CountryPlacesScreen(this.country);

  @override
  Widget build(BuildContext context) {
    /*final country = ModalRoute.of(context)!.settings.arguments as Country;
    
    final countryPlaces = DUMMY_PLACES.where((places) {
      return places.paises.contains(country.id);
    }).toList();*/

    final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;

    //Projeto projeto = parametros[0];

    final tarefaItem = DUMMY_TAREFAS.where((tarefas) {
      return tarefas.id == projeto.id;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(projeto.titulo),
      ),
      body:/* ListView.builder(
          //itemCount: countryPlaces.length,
          itemCount: tarefaItem.length,
          itemBuilder: (ctx, index) {
            return TarefaItem(tarefaItem[index]);
          }*/
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(projeto.descricao),
                Expanded(
                  child: SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                      //itemCount: countryPlaces.length,
                      itemCount: tarefaItem.length,
                      itemBuilder: (ctx, index) {
                        return TarefaItem(tarefaItem[index]);
                      },
                    ),
                  ),
                ),
                ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, AppRoutes.TAREFA_CADASTRO, arguments: projeto)/*cadastrarTarefa*/, child: Text('Cadastrar Tarefa'))      
              ],
            ),
          ),

    );
  }
  
  void cadastrarTarefa() {
    //Navigator.pushNamed(context, AppRoutes.TAREFA_CADASTRO, /*arguments: */);
    //Navigator.push(context,MaterialPageRoute(builder: (context) => TarefaCadastroScreen()));
    //Navigator.of(context).push(MaterialAppPageRoute(builder: (context)=>TarefaCadastroScreen));
    //Navigator.of(context).pushNamed('/tarefa-cadastro');
    //Navigator.of(context).pushReplacedNamed('/home');
  }
}
