import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoReponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoReponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']
            .toString()), //o 'texto' é a chave que quero acessar
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => quandoReponder(int.parse(resp['pontuacao'].toString())), // o primeiro metodo () é para resposta
          );
        }).toList(),
      ],
    );
  }
}
