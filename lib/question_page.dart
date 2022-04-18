// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, deprecated_member_use

import "package:flutter/material.dart";

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  // 問題
  List<String> questions = [
    "第1問...",
    "第2問...",
    "第3問...",
    "第4問...",
    "第5問...",
  ];

  // 答え
  List<bool> answers = [true, false, true, true, false];

  // 問題番号の管理
  int questionNumber = 0;

  // 正解数の管理
  int numberOfCorrectAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.orange),
          // backgroundColor: Colors.white,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 4,
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          questions[questionNumber],
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ))),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RaisedButton(
                      onPressed: () {
                        bool correctAnswer = answers[questionNumber];

                        // 正解だった場合、正解数に1を足す
                        if (correctAnswer == true) {
                          numberOfCorrectAnswer++;
                        }

                        // 問題番号が問題数未満の場合、問題数に1を足す
                        if (questionNumber + 1 < questions.length) {
                          setState(() {
                            questionNumber++;
                          });
                        } else {
                          // 結果画面に遷移
                        }
                      },
                      child: Text("○", style: TextStyle(fontSize: 20.0)),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RaisedButton(
                      onPressed: () {
                        bool correctAnswer = answers[questionNumber];

                        // 不正解だった場合、正解数に1を足す
                        if (correctAnswer == false) {
                          numberOfCorrectAnswer++;
                        }

                        // 問題番号が問題数未満の場合、問題数に1を足す
                        if (questionNumber + 1 < questions.length) {
                          setState(() {
                            questionNumber++;
                          });
                        } else {
                          // 結果画面に遷移
                        }
                      },
                      child: Text("×", style: TextStyle(fontSize: 30.0)),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ))
              ])),
      debugShowCheckedModeBanner: false,
    );
  }
}
