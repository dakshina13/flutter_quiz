import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
    {
      "questionText": "What\'s your favourite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 8},
        {"text": "Green", "score": 4},
        {"text": "White", "score": 0}
      ]
    },
    {
      "questionText": "What\'s your favourite animal?",
      "answers": [
        {"text": "Snake", "score": 8},
        {"text": "Cat", "score": 0},
        {"text": "Dog", "score": 4},
        {"text": "Lion", "score": 10},
      ]
    },
    {
      "questionText": "Who\'s your favourite instructor?",
      "answers": [
        {"text": "A", "score": 10},
        {"text": "B", "score": 8},
        {"text": "D", "score": 0},
        {"text": "C", "score": 4},
      ]
    },
  ];
  var _totalScore=0;
  void _answerQuestion(int score) {

    _totalScore+=score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("have more questions");
    } else {
      print("NO more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(),
      ),
    );
  }
}
