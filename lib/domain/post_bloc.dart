import 'package:somawebservice/domain/post.dart';
import 'package:somawebservice/services/api_response.dart';
import 'package:somawebservice/services/posts_service.dart';
import 'package:somawebservice/util/simple_bloc.dart';

class PostBloc extends SimpleBloc<ApiResponse>{
  Future<ApiResponse<List<Post>>> obterPosts() async{
    // Obtendo os posts
    ApiResponse<List<Post>> response = await PostsService.obterPosts();
    this.add(response);
    return response;
  }
}
