import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:somawebservice/domain/post.dart';
import 'package:somawebservice/services/api_response.dart';

class PostsService{
  static Future<ApiResponse<List<Post>>> obterPosts() async {
    try {
      var _url = "https://jsonplaceholder.typicode.com/posts/";
    // var _url = "https://jsonnnnnnplaceholder.typicode.com/posts/";

      print("GET --> $_url");

      // This example uses the Google Books API to search for books about http.
      // https://developers.google.com/books/docs/overview
    //  var url =
   //   Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'})

      final _myUri = Uri.parse(_url);
      var _response = await http.get(_myUri);

      // Solicitação feita com sucesso
      if(_response.statusCode == 200){
        List listMapResponse = json.decode(_response.body);
        final listPosts = listMapResponse.map<Post>((mapPost) => Post.fromJson(mapPost)).toList();
        return ApiResponse.ok(listPosts);
      }else
        return ApiResponse.error("Status do erro emitido pelo servidor: ${_response.statusCode}");

    } on Exception catch (erro){
      return  ApiResponse.error("Erro na conexão: ${erro.toString()}");
    }
  }
}
