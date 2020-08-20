import 'package:Quiz_App/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
  final _questions = const [
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
      if (_questionIndex < _questions.length)
        _questionIndex = _questionIndex + 1;
      else
        print("No more Questions !");
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
        body: _questionIndex < _questions.length 
        ? Quiz(answerQuestion:_answerQuestion,questions:_questions,questionIndex: _questionIndex)
        : Result(),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}
