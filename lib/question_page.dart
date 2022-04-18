// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, deprecated_member_use

import "package:flutter/material.dart";

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold( 
        appBar: AppBar( 
          backgroundColor: Colors.orange
        ),
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
                  "問題",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                )
              )
            ), 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton( 
                  onPressed: () {},
                  child: Text(
                    "○",style: TextStyle( 
                    fontSize: 20.0
                    )
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(15.0)
                  )
                ),
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton( 
                  onPressed: () {},
                  child: Text(
                    "×",style: TextStyle( 
                    fontSize: 30.0
                    )
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(15.0)
                  )
                ),
              )
            )
          ]
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
