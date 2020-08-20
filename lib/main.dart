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
        'answers': [{'text':'White','score':10}, {'text':'Yellow','score':5}, {'text':'Blue','score':3}, {'text':'Red','score':1}]
      },
      {
        'questionText': 'What\'s your favourite animal ?',
        'answers': [{'text':'Tiger','score':10}, {'text':'Lion','score':5}, {'text':'Deer','score':3}, {'text':'Zebra','score':1}]
      },
      {
        'questionText': 'Who\'s your favourite Actor ?',
        'answers': [{'text':'Nivin Pauly','score':10}, {'text':'Fahad Fasil','score':5}, {'text':'Dulquar Salman','score':3}, {'text':'Asif Ali','score':1}]
      },
    ];

  var _questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz(){
    setState(() {
    _questionIndex=0;
    _totalScore=0;      
    });
  }

  void _answerQuestion(int score) {
    _totalScore=_totalScore+score;

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
        : Result(_totalScore,_resetQuiz),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}
