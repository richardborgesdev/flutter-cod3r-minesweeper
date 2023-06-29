import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../components/campo_widget.dart';
import '../models/campo.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({super.key});

  void _reiniciar() {
    print('reiniciar');
  }

  void _abrir(Campo campo) {
    print('abrir');
  }

  void _alternarMarcacao(Campo campo) {
    print('alternarMarcacao');
  }

  @override
  Widget build(BuildContext context) {
    Campo campo = Campo(
      linha: 0,
      coluna: 0,
    );
    campo.abrir();

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
