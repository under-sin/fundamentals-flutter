import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:questions_project/quiz.dart';
import 'package:questions_project/result.dart';

main() => runApp(QuestionsApp());

// no dart, quando queremos deixar algo privado usar o _ na frente do nome
class _QuestionsAppState extends State<QuestionsApp> {
  var _selectQuestion = 0;

  final _questions = const [
    {
      'text': 'Qual a sua cor favorita',
      'response': ['Preto', 'Verde', 'Azul', 'Rosa']
    },
    {
      'text': 'Qual a sua banda favorita',
      'response': ['BMTH', 'Coldplay', 'Scarlen', 'Starset']
    },
    {
      'text': 'Qual o seu animal favorito',
      'response': ['Coruja', 'Sapo', 'Coala', 'Raposa']
    }
  ];

  void _response() {
    if (haveQuestion) {
      setState(() {
        _selectQuestion++;
      });
    }
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
            : Result(),
      ),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  _QuestionsAppState createState() {
    return _QuestionsAppState();
  }
}
