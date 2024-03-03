import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Azul', 'pontuacao': 8},
        {'texto': 'Amarelo', 'pontuacao': 9},
        {'texto': 'Preto', 'pontuacao': 7},
        {'texto': 'Branco', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Peixe', 'pontuacao': 10},
        {'texto': 'Coelho', 'pontuacao': 7},
        {'texto': 'Cachorro', 'pontuacao': 9},
        {'texto': 'Gato', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': [
        {'texto': 'João', 'pontuacao': 7},
        {'texto': 'Pedro', 'pontuacao': 8},
        {'texto': 'Carlos', 'pontuacao': 10},
        {'texto': 'Luiz', 'pontuacao': 9},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
