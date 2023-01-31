import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int punctuation;
  final void Function() resetQuiz;

  Result(this.punctuation, this.resetQuiz);

  String? get phraseResult {
    if (punctuation < 8) {
      return 'Congratulations';
    } else if (punctuation < 12) {
      return 'You is good!';
    } else if (punctuation < 18) {
      return 'Nice bro!!';
    } else {
      return 'You is a Jedi? good';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // centraliza os itens vertialmente
      children: [
        Center(
            child: Text(
          phraseResult!,
          style: TextStyle(fontSize: 28),
        )),
        TextButton(
          child: Text(
            'Reset?',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: resetQuiz,
        )
      ],
    );
  }
}
