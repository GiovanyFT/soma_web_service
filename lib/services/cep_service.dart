
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:somawebservice/domain/endereco.dart';
import 'package:somawebservice/services/api_response.dart';

class CepService{
  static Future<ApiResponse<Endereco>> obterCep(String cep) async {
    try{
     // var _url = "http://api.postmon.com.br/v1/cep/" + cep;
      var _url = "https://viacep.com.br/ws/$cep/json/";

      final _myUri = Uri.parse(_url);
      var _response = await http.get(_myUri);

      // Solicitação feita com sucesso
      if(_response.statusCode == 200){
        Map<String, dynamic> mapResponse = json.decode(_response.body);
        Endereco endereco = Endereco.fromJson(mapResponse);
        return ApiResponse.ok(endereco);
      }
      else
        return ApiResponse.error("Status do erro emitido pelo servidor: ${_response.statusCode}");
    } on Exception catch (erro){
      return  ApiResponse.error("Erro na conexão: ${erro.toString()}");
    }
  }
}
