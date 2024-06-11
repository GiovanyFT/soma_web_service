import 'package:flutter/material.dart';
import 'package:somawebservice/domain/post_bloc.dart';
import 'package:somawebservice/services/resposta_servico.dart';
import 'package:somawebservice/tabs/localwidget/listview_post_card.dart';

class TabPosts2 extends StatefulWidget {
  @override
  _TabPostsState2 createState() => _TabPostsState2();
}

// Esse "with AutomaticKeepAliveClientMixin<TabPosts2>" vai ser usado para não recarregar
// os dados dessa aba
class _TabPostsState2 extends State<TabPosts2> with AutomaticKeepAliveClientMixin<TabPosts2>{
  // Mantém a aba ativa para não recarregamento dos dados
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // Usando o padrão Bloc da Google para trabalhar com Streams
  final _postBloc = PostBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postBloc.obterPosts();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _postBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Não pode esquecer dessa linha para não acontecer o recarregamento
    super.build(context);

    return StreamBuilder<RespostaServico>(
      stream: _postBloc.stream,
      builder: (context, snapshot) {
        // Vai colocar um progress enquanto os posts não forem carregados
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        RespostaServico resposta = snapshot.data!;

        // Se houve algum erro
        if (!(resposta.sucesso))
          return Center(
            child: Text(
              resposta.mensagemErro!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
            ),
          );
        // RefreshIndicator é um widget para atualizar a lista de posts
        // deslizando o dedo para baixo
        return RefreshIndicator(
            onRefresh: _postBloc.obterPosts,
            // Aqui temos a lista de posts sendo informada para o ListView
            child: ListViewPostCard(resposta.resultado)
        );
      },
    );
  }
}
