// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geeksalonquizapp/result_page.dart';

// Questionクラス内で、firebaseから情報取ってきて、各変数に入れられればOK

class Question extends StatefulWidget {
  // コースの選択
  late String course;
  Question({required this.course});

  @override
  _QuestionState createState() => _QuestionState(course: course);
}

class _QuestionState extends State<Question> {
  // 問題番号の管理
  int questionNumber = 0;

  // 正解数の管理
  int numberOfCorrectAnswers = 0;

  // コースの選択
  late String course;
  _QuestionState({required this.course});

  // questions情報の初期値
  late List<String> quiz_statements = ["web1"];
  late List<bool> answers = [true];
  late List<String> answer_statements = ["Web2"];

  // Firebaseからデータを取得するまでinitStateを待つ。非同期処理
  @override
  void initState() {
    super.initState();
    getQuestionsFromFirebase(course);
  }

  // Question情報をFirebaseから取得し、Stateを構築
  Future<void> getQuestionsFromFirebase(String course) async {
    List<String> quiz_s = [];
    List<bool> ans = [];
    List<String> ans_s = [];

    CollectionReference questions =
        FirebaseFirestore.instance.collection('questions');

    await questions
        .where("course", isEqualTo: course)
        .get()
        .then((QuerySnapshot querysnapshot) {
      querysnapshot.docs.forEach((doc) {
        quiz_s.add(doc.get("quiz_statement"));
        ans.add(doc.get("answer"));
        ans_s.add(doc.get("answer_statement"));
      });
    });

    setState(() {
      quiz_statements = quiz_s;
      answers = ans;
      answer_statements = ans_s;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(quiz_statements);
    return quiz_statements.isEmpty
        ? CircularProgressIndicator()
        : MaterialApp(
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
                              if (correctAnswer) {
                                numberOfCorrectAnswers++;
                              }

                              // ダイアログを出す
                              openDialog(context, correctAnswer,
                                  answer_statements[questionNumber],true);
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
                              if (!correctAnswer) {
                                numberOfCorrectAnswers++;
                              }

                              // ダイアログを出す
                              openDialog(context, correctAnswer,
                                  answer_statements[questionNumber],false);
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

  void openDialog(BuildContext context, correctAnswer, answer_statement,ans) {
    var answer_text = "不正解！";
    if (correctAnswer == ans) {
      answer_text = "正解！";
    }

    showDialog(
      context: context,
      // ignore: unnecessary_new
      builder: (BuildContext context) => new SimpleDialog(
        title: new Text(answer_text),
        children: <Widget>[
          Text(answer_statement),
          SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);

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
                        numberOfCorrectAnswers: numberOfCorrectAnswers)));
                }
              },
              child: Text("Continue"))
        ],
      ),
    );
  }
}
