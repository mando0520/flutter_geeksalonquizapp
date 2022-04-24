// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:geeksalonquizapp/question_page.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            Text(
              "はじめる", 
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.green)
            ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                this.context,
                MaterialPageRoute(
                  builder: (context) => Question(course:"Web")
                ),
              );
            },
            child: Text(
              "Web", 
              style: TextStyle(
                fontSize: 20.0)
            ),
            color: Colors.red,
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
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                this.context,
                MaterialPageRoute(
                  builder: (context) => Question(course:"iPhone")
                ),
              );
            },
            child: Text(
              "iPhone", 
              style: TextStyle(
                fontSize: 20.0)
            ),
            color: Colors.orange,
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
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                this.context,
                MaterialPageRoute(
                  builder: (context) => Question(course:"Game")
                ),
              );
            },
            child: Text(
              "Game", 
              style: TextStyle(
                fontSize: 20.0)
            ),
            color: Colors.blue,
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
          ),
        ]
      )
    );
  }
}
