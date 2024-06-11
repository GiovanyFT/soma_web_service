class RespostaServico<R>{
  bool get sucesso => ((resultado != null) && (mensagemErro == null));
  String? mensagemErro = null;
  R? resultado = null;

  RespostaServico(this.resultado);
  RespostaServico.erro(this.mensagemErro);
}