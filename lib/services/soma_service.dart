

import 'package:http/http.dart' as http;
import 'package:somawebservice/services/api_response.dart';
class SomaService{
  static Future<ApiResponse<String>> somar(String valor1, String valor2) async {
    try{
      var _url = "http://col.ifes.edu.br/giovany/soma.php";
      //var _url = "http://essapaginanaoexiste/giovany/soma.php";

      Map _params = {
        'numero1' : valor1,
        'numero2' : valor2,
      };

      var _response = await http.post(_url, body: _params);

      // Solicitação feita com sucesso
      if(_response.statusCode == 200)
        return ApiResponse.ok(_response.body);
      else
        return ApiResponse.error("Status do erro emitido pelo servidor: ${_response.statusCode}");
    } on Exception catch (erro){
      return ApiResponse.error("Erro na conexão: ${erro.toString()}");
    }
  }
}