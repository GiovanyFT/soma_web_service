import 'dart:async';

import 'package:flutter/material.dart';
import 'package:somawebservice/services/api_response.dart';
import 'package:somawebservice/widget/botao_azul.dart';

class BotaoAzulServicoWeb extends StatefulWidget {
  String texto;
  double tamanho_fonte;
  Color cor_fonte;
  Function pre_servico;
  Function acionar_servico;
  Function(ApiResponse response) pos_servico;
  FocusNode marcador_foco;

  BotaoAzulServicoWeb(
      {this.texto,
      this.tamanho_fonte,
      this.cor_fonte,
      this.pre_servico = null,
      this.acionar_servico,
      this.pos_servico = null,
      this.marcador_foco});

  @override
  _BotaoAzulServicoWebState createState() => _BotaoAzulServicoWebState();
}

class _BotaoAzulServicoWebState extends State<BotaoAzulServicoWeb> {
  final _streamController = StreamController<bool>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _streamController.stream,
      initialData: false,
      builder: (context, snapshot){
        return BotaoAzul(
          texto: widget.texto,
          // Vai ter valor true antes do serviço e valor false
          // inicialmente (initialData) e depois do serviço
          mostrar_progress: snapshot.data,
          ao_clicar: () async {

            if (widget.pre_servico != null){
              // Se não conseguiu validar o que era necessário antes do serviço
              if (!widget.pre_servico()){
                return;
              }
            }

            // Vai colocar o progress visível
            _streamController.add(true);

            // Aciona o serviço
            ApiResponse response = await widget.acionar_servico();

            // Vai voltar com o texto para o botão
            _streamController.add(false);

            // Vai atualizar a tela com os resultados obtidos no serviço
            widget.pos_servico(response);
          },
        );
      },
    );
  }
}
