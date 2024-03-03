import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 22) {
      return 'Parabéns!';
    } else if (pontuacao < 25) {
      return 'Você é bom!';
    } else if (pontuacao < 28) {
      return 'Impressionante';
    } else {
      return 'Nível jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
            style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.blue),
            ),
            onPressed: reiniciarQuestionario,
            child: const Text(
              'Reiniciar',
              style: TextStyle(fontSize: 18),
            ),
        )
      ],
    );
  }
}
