import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  var _objScore = new List();

  static const questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Red', 'score': 3},
        {'text': 'Yellow', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ]
    },
    {
      'questionText': 'What\'s your favorite food ?',
      'answer': [
        {'text': 'Bakso', 'score': 1},
        {'text': 'Batagor', 'score': 1},
        {'text': 'Nasi Goreng', 'score': 1},
        {'text': 'Sate', 'score': 1}
      ]
    }
  ];

  void _answerQuestion(int score, String choice) {
    setState(() {
      _questionIndex++;
      _objScore.add({'idx': _questionIndex, 'score': score, 'choice': choice});
    });
    print(_objScore);
    if (_questionIndex < questions.length) {
      print('Have More Question ...');
    } else {
      print('Don\t have more question ...');
      _objScore.forEach((score) {
        _totalScore += score['score'];
      });
    }
  }

  void _backToHome() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _objScore.clear();
    });
  }

  void _backPage() {
    _objScore.removeWhere((e) => e['idx'] == _questionIndex);
    setState(() {
      _questionIndex = _questionIndex - 1;
    });
    print(_objScore);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Question App')),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: _answerQuestion,
                backPage: _backPage,
                questionIndex: _questionIndex)
            : Result(
                backToHome: _backToHome,
                resultText: "Thank you for filling out the question",
                btnBackText: "Back to home",
                resultScore: _totalScore,
                objResultAnswer: _objScore,
              ),
      ),
    );
  }
}
