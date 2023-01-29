import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:questions_project/question.dart';
import 'package:questions_project/response.dart';

main() => runApp(QuestionsApp());

// no dart, quando queremos deixar algo privado usar o _ na frente do nome
class _QuestionsAppState extends State<QuestionsApp> {
  var _selectQuestion = 0;

  void _response() {
    setState(() {
      _selectQuestion++;
    });
    print(_selectQuestion);
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
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

    List<Widget> answers = [];
    for(String resp in questions[_selectQuestion].cast()['response']) {
      answers.add(Response(resp, _response));
    }

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
        body: Column(
          children: [
            Question(questions[_selectQuestion]['text'].toString()),
            ...answers,
          ],
        ),
      ),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  _QuestionsAppState createState() {
    return _QuestionsAppState();
  }
}
