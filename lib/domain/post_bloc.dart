import 'package:somawebservice/domain/post.dart';
import 'package:somawebservice/services/resposta_servico.dart';
import 'package:somawebservice/services/posts_service.dart';
import 'package:somawebservice/util/simple_bloc.dart';

class PostBloc extends SimpleBloc<RespostaServico>{
  Future<RespostaServico<List<Post>>> obterPosts() async{
    // Obtendo os posts
    RespostaServico<List<Post>> resposta = await PostsService.obterPosts();
    this.add(resposta);
    return resposta;
  }
}
