// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:geeksalonquizapp/question_page.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GeekSalonQuiz",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 60, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/top.png', height: 200),
              Expanded(child: StartPage())
            ],
          ),
        ),
      ),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  Widget courseButton(String course, color) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 50.0,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                this.context,
                MaterialPageRoute(
                    builder: (context) => Question(course: course)),
              );
            },
            child: Text(course,
                style: TextStyle(fontSize: 30.0, color: Colors.white)),
            color: color.withOpacity(0.8),
            elevation: 15.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            )
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
          Text("GeekSalonクイズ",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)
          ),
          Text("ランダム5問",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)
          ),
          courseButton("Web", Colors.red),
          courseButton("iPhone", Colors.orange),
          courseButton("Game", Colors.blue)
        ]
      )
    );
  }
}
