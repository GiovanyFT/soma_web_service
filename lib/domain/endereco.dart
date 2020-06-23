class Endereco {
  String complemento;
  String bairro;
  String cidade;
  String logradouro;
  String estado;

  Endereco.fromJson(Map<String, dynamic> map){
    complemento = map["complemento"];
    bairro = map["bairro"];
    cidade = map["cidade"];
    logradouro = map["logradouro"];
    estado = map["estado"];
  }

  Endereco({this.complemento,
            this.bairro,
            this.cidade,
            this.logradouro,
            this.estado});

  @override
  String toString() {
    return 'Endereco{complemento: $complemento, '
        'bairro: $bairro, cidade: $cidade, '
        'logradouro: $logradouro, estado: $estado}';
  }
}
