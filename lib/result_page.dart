// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geeksalonquizapp/start_page.dart';
import 'package:audioplayers/audioplayers.dart';

class Result extends StatelessWidget {
  AudioCache _player = AudioCache();
  final int numberOfCorrectAnswers;

  Result({required this.numberOfCorrectAnswers});

  Widget resultWordsWidget(String result_word) {
    return Center(
        child: Text(result_word,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));
  }

  Widget resultWords() {
    if (numberOfCorrectAnswers < 3) {
      return resultWordsWidget("もっと勉強しよう！(^^)/");
    } else if (numberOfCorrectAnswers < 5) {
      return resultWordsWidget("もう少し！(^^)/");
    } else {
      return resultWordsWidget("よく頑張った！(^^)/");
    }
  }

  final highlightStyle =
      TextStyle(color: Colors.red, fontSize: 30.0, fontWeight: FontWeight.bold);

  final basicStyle = TextStyle(
      color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    _player.play('sounds/kekka.mp3');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GeekSalonQuiz",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/top.png', height: 200),
            Padding(
                padding: EdgeInsets.only(top: 60, bottom: 10),
                child: Center(
                    child: RichText(
                        text: TextSpan(
                  children: [
                    TextSpan(text: "5問中", style: basicStyle),
                    TextSpan(
                        text: numberOfCorrectAnswers.toString(),
                        style: highlightStyle),
                    TextSpan(text: "問正解！", style: basicStyle)
                  ],
                )))),
            Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: Center(child: resultWords())),
            ButtonTheme(
                minWidth: 180.0,
                height: 50.0,
                child: Center(
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Start()));
                        },
                        child: Text("はじめに戻る",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))))
          ])),
    );
  }
}
