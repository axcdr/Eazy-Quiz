import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final questions = const [
      {
        'questionText': 'What\'s your favourite color ?',
        'answers': ['White', 'Yellow', 'Blue', 'Red']
      },
      {
        'questionText': 'What\'s your favourite animal ?',
        'answers': ['Tiger', 'Lion', 'Deer', 'Zebra']
      },
      {
        'questionText': 'Who\'s your favourite Actor ?',
        'answers': ['Nivin Pauly', 'Fahad Fasil', 'Dulquar Salman', 'Asif Ali']
      },
    ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex < questions.length)
        _questionIndex = _questionIndex + 1;
      else
        _questionIndex = 0;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
