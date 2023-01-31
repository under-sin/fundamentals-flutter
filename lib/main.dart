import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:questions_project/quiz.dart';
import 'package:questions_project/result.dart';

main() => runApp(QuestionsApp());

// no dart, quando queremos deixar algo privado usar o _ na frente do nome
class _QuestionsAppState extends State<QuestionsApp> {
  var _selectQuestion = 0;
  var _totalPunctuation = 0;

  final _questions = const [
    {
      'text': 'Qual a sua cor favorita',
      'response': [
        {'text': 'Preto', 'punctuation': 10},
        {'text': 'Verde', 'punctuation': 5},
        {'text': 'Azul', 'punctuation': 3},
        {'text': 'Rosa', 'punctuation': 1},
      ]
    },
    {
      'text': 'Qual a sua banda favorita',
      'response': [
        {'text': 'BMTH', 'punctuation': 10},
        {'text': 'Coldplay', 'punctuation': 5},
        {'text': 'Scarlen', 'punctuation': 3},
        {'text': 'Starset', 'punctuation': 1},
      ]
    },
    {
      'text': 'Qual o seu animal favorito',
      'response': [
        {'text': 'Coruja', 'punctuation': 10},
        {'text': 'Sapo', 'punctuation': 5},
        {'text': 'Coala', 'punctuation': 3},
        {'text': 'Raposa', 'punctuation': 1},
      ]
    }
  ];

  void _response(int punctuation) {
    if (haveQuestion) {
      setState(() {
        _selectQuestion++;
        _totalPunctuation += punctuation;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _selectQuestion = 0;
      _totalPunctuation = 0;
    });
  }

  // corrigindo problema quando passava do indice
  bool get haveQuestion {
    return _selectQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              'Asking',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: haveQuestion
            ? Quiz(
                questions: _questions,
                selectQuestion: _selectQuestion,
                response: _response,
              )
            : Result(_totalPunctuation, _resetQuiz),
      ),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  _QuestionsAppState createState() {
    return _QuestionsAppState();
  }
}
