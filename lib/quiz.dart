import 'package:flutter/material.dart';
import 'package:questions_project/question.dart';
import 'package:questions_project/response.dart';

class Quiz extends StatelessWidget {
  final int selectQuestion;
  final List<Map<String, Object>> questions;
  final void Function() response;

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
    List<String> resp =
    haveQuestion ? questions[selectQuestion].cast()['response'] : [];

    return Column(
      children: [
        Question(questions[selectQuestion]['text'].toString()),
        ...resp.map((t) => Response(t, response)).toList(),
      ],
    );
  }
}
