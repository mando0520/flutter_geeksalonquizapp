// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors

import "package:flutter/material.dart";
import "package:geeksalonquizapp/question_page.dart";

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
          ),
          // backgroundColor: Colors.white,
          body: SafeArea(
            child: StartPage(),
          )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            this.context,
            MaterialPageRoute(
              builder: (context) => Question()
            ),
          );
        },
        child: Text(
          "はじめる", 
          style: TextStyle(
            fontSize: 20.0)
        ),
        color: Colors.green,
        elevation: 15.0,
        padding: EdgeInsets.symmetric(
          vertical: 15.0, 
          horizontal: 100.0
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.0
          )
        )
      )
    );
  }
}
