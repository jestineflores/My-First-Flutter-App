import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = [
    {
      'questionText': 'What is your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Yellow', 'score': 8},
        {'text': 'Blue', 'score': 5},
        {'text': 'Green', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 7},
        {'text': 'Rabbit', 'score': 4},
        {'text': 'Elephant', 'score': 2}
      ],
    },
    {
      'questionText': 'What is your favorite city ?',
      'answers': [
        {'text': 'Denver', 'score': 5},
        {'text': 'Seattle', 'score': 6},
        {'text': 'New York', 'score': 4},
        {'text': 'Washington DC', 'score': 3}
      ],
    }
  ];
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
    if (questionIndex < questions.length) {
      print('We have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
            ),
            body: questionIndex < questions.length
                ? Quiz(
                    answerQuestion: answerQuestion,
                    questionIndex: questionIndex,
                    questions: questions,
                  )
                : Result(totalScore, resetQuiz)));
  }
}
