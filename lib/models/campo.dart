import 'package:flutter/foundation.dart';
import 'explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    required this.linha,
    required this.coluna,
  });

  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }

    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) {
      return;
    }

    _aberto = true;

    if (_minado) {
      _explodido = true;
    }

    if (vizinhancaSegura) {
      vizinhos.forEach((vizinho) {
        vizinho.abrir();
      });
    }
  }

  void revelarBombas() {
    if (_minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get marcado {
    return _marcado;
  }

  bool get resolvido {
    bool minadoEMarcado = _minado && _marcado;
    bool seguroEAberto = !_minado && _aberto;

    return minadoEMarcado || seguroEAberto;
  }

  bool get vizinhancaSegura {
    return vizinhos.every((vizinho) => !vizinho._minado);
  }

  int get qtdeMinasNaVizinhanca {
    return vizinhos.where((vizinho) => vizinho.minado).length;
  }
}
