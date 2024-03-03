import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {

  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print('Pergunta respondida');
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'resposta': ['Azul','Amarelo','Preto','Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': ['Peixe','Coelho','Cachorro','Gato'],
      },
      {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': ['João','Pedro','Carlos','Luiz'],
      },
    ];

    List<String> respostas = perguntas[_perguntaSelecionada].cast()['resposta'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((textoResposta) => Resposta(textoResposta, _responder)).toList(),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }

}