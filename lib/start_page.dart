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
          padding: EdgeInsets.only(top: 30, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/top.png',height: 200),
              Expanded(
                child: StartPage()
              )
            ],
          ),
        ) ,    
      ),
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
              "GeekSalonクイズ", 
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)
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
                fontSize: 30.0,
                color: Colors.white
              )
            ),
            color: Colors.red.withOpacity(0.8),
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
                fontSize: 30.0,
                color: Colors.white
              )
            ),
            color: Colors.orange.withOpacity(0.8),
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
                fontSize: 30.0,
                color: Colors.white
              )
            ),
            color: Colors.blue.withOpacity(0.8),
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
