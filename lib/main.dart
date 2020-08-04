import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What is your favorite color ?',
        'answers': ['Black', 'Yellow', 'Blue', 'Green'],
      },
      {
        'questionText': 'What\'s your favorite animal ?',
        'answers': ['Dog', 'Cat', 'Rabbit', 'Elephant'],
      },
      {
        'questionText': 'What is your favorite city ?',
        'answers': ['Denver', 'Seattle', 'New York', 'Washington DC'],
      }
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: Column(
        children: [
          Question(
            questions[questionIndex]['questionText'],
          ),
          ...(questions[questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(answerQuestion, answer);
          }).toList()
        ],
      ),
    ));
  }
}
