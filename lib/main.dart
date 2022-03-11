import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(PerguntasApp());
}

class _PerguntasAppState extends State<PerguntasApp> {
  var _perguntaSelecionada =
      0; //a varivel que esta sendo alterada, o estado controla essa variavel
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    //a inferencia já faz o seu papel, List<Map<String, Object>>
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    }
  ];
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        //qualquer mudança que for feita em _perguntaSelecionada vai mudar a interface, garante que a mudança vai ter consequencias visiveis
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  // a build foi pq depende do estado para ser renderizada, a arvore de componentes precisa do estado. Quando acontece uma mudança no estado a arvore de componentes precisa ser reativa
  Widget build(BuildContext context) {
    //operador tenário pois só se atender a possibilidade as coisas aparecem

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoReponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  //o statefulwidget é um componente
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}
