// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geeksalonquizapp/result_page.dart';
import 'package:audioplayers/audioplayers.dart';

// Questionクラス内で、firebaseから情報取ってきて、各変数に入れられればOK

class Question extends StatefulWidget {
  // コースの選択
  late String course;
  Question({required this.course});

  @override
  _QuestionState createState() => _QuestionState(course: course);
}

class _QuestionState extends State<Question> {
  AudioCache _player = AudioCache();

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

  // Question情報をFirebaseから取得し、シャッフルしてStateを構築
  Future<void> getQuestionsFromFirebase(String course) async {
    List<String> quiz_s = [];
    List<bool> ans = [];
    List<String> ans_s = [];

    List<String> quiz_s_shuffled = [];
    List<bool> ans_shuffled = [];
    List<String> ans_s_shuffled = [];

    List<int> map = [0, 1, 2, 3, 4];

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

    map.shuffle();

    for (var i = 0; i < 5; i++) {
      quiz_s_shuffled.add(quiz_s[map[i]]);
      ans_shuffled.add(ans[map[i]]);
      ans_s_shuffled.add(ans_s[map[i]]);
    }

    setState(() {
      quiz_statements = quiz_s_shuffled;
      answers = ans_shuffled;
      answer_statements = ans_s_shuffled;
    });
  }

  Widget answerButton(bool userAnswer) {
    return ButtonTheme(
      minWidth: 120.0,
      height: 120.0,
      child: RaisedButton(
          onPressed: () {
            bool correctAnswer = answers[questionNumber];

            // 正解だった場合、正解数に1を足す
            // 音を鳴らす
            if (userAnswer == correctAnswer) {
              numberOfCorrectAnswers++;
              _player.play('sounds/correct_buzzer.mp3');
            } else {
              _player.play('sounds/wrong_buzzer.mp3');
            }

            // ダイアログを出す
            openDialog(context, correctAnswer,
                answer_statements[questionNumber], userAnswer);
          },
          child: Text(userAnswer ? "○" : "✕",
              style: TextStyle(
                fontSize: 70.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          color: userAnswer
              ? Colors.red.withOpacity(0.8)
              : Colors.blue.withOpacity(0.8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(quiz_statements);
    print(answer_statements);
    return quiz_statements.length == 1
        ? CircularProgressIndicator()
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "GeekSalonQuiz",
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            home: Scaffold(
              body: Padding(
                  padding: EdgeInsets.only(top: 60, bottom: 30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/top.png', height: 200),
                        Expanded(
                            flex: 1,
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  quiz_statements[questionNumber],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ))),
                        Expanded(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              answerButton(true),
                              answerButton(false),
                            ]))
                      ])),
            ));
  }

  void openDialog(BuildContext context, correctAnswer, answer_statement, ans) {
    var answer_text = "不正解！";
    var ans_color = Colors.blue;
    if (correctAnswer == ans) {
      answer_text = "正解！";
      ans_color = Colors.red;
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Text(
                  answer_text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ans_color,
                  ),
                  textAlign: TextAlign.center,
                ),
                content: Text(answer_statement),
                actions: <Widget>[
                  ButtonTheme(
                      minWidth: 60.0,
                      height: 35.0,
                      child: Center(
                        child: RaisedButton(
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
                                            numberOfCorrectAnswers:
                                                numberOfCorrectAnswers)));
                              }
                            },
                            child: Text("Continue",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ))
                ],
              )
            );
        });
  }
}
