// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geeksalonquizapp/result_page.dart';

// Questionクラス内で、firebaseから情報取ってきて、各変数に入れられればOK

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  // 問題番号の管理
  int questionNumber = 0;

  // 正解数の管理
  int numberOfCorrectAnswers = 0;

  late List<String> quiz_statements = ["web0"];
  late List<bool> answers = [true];
  late List<String> answer_statements = ["web0"];

  @override
  Widget build(BuildContext context) {
    if (questionNumber == 0) {
      CollectionReference questions =
          FirebaseFirestore.instance.collection('questions');

      // questionsコレクションからデータを取得する
      questions.get().then((QuerySnapshot querysnapshot) {
        querysnapshot.docs.forEach((doc) {
          quiz_statements.add(doc.get("quiz_statement"));
          answers.add(doc.get("answer"));
          answer_statements.add(doc.get("answer_statement"));
        });
      });
      print(quiz_statements);
    }


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
                          quiz_statements[questionNumber],
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
                          numberOfCorrectAnswers++;
                        }

                        // 問題番号が問題数未満の場合、問題数に1を足す
                        if (questionNumber + 1 < quiz_statements.length) {
                          setState(() {
                            questionNumber++;
                          });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Result(
                                      numberOfCorrectAnswers:
                                          numberOfCorrectAnswers)));
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
                          numberOfCorrectAnswers++;
                        }

                        // 問題番号が問題数未満の場合、問題数に1を足す
                        if (questionNumber + 1 < quiz_statements.length) {
                          setState(() {
                            questionNumber++;
                          });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Result(
                                      numberOfCorrectAnswers:
                                          numberOfCorrectAnswers)));
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
