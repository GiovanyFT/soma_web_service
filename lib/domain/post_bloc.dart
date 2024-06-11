import 'package:somawebservice/domain/post.dart';
import 'package:somawebservice/services/resposta_servico.dart';
import 'package:somawebservice/services/posts_service.dart';
import 'package:somawebservice/util/simple_bloc.dart';

class PostBloc extends SimpleBloc<RespostaServico>{
  Future<RespostaServico<List<Post>>> obterPosts() async{
    // Obtendo os posts
    RespostaServico<List<Post>> response = await PostsService.obterPosts();
    this.add(response);
    return response;
  }
}
