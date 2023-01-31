import 'package:flutter/material.dart';
import 'package:questions_project/question.dart';
import 'package:questions_project/response.dart';

class Quiz extends StatelessWidget {
  final int selectQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int) response;

  Quiz({
    // required torna o parametro obrigatorio
    required this.questions,
    required this.selectQuestion,
    required this.response,
  });

  bool get haveQuestion {
    return selectQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> resp = haveQuestion
        ? questions[selectQuestion].cast()['response']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Question(questions[selectQuestion]['text'].toString()),
        ...resp.map((resp) {
          return Response(
            resp['text'] as String,
            () => response(int.parse(resp['punctuation'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
