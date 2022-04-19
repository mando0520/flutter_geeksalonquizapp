import 'package:flutter/material.dart';
import 'package:geeksalonquizapp/start_page.dart';

class Result extends StatelessWidget {
  final int numberOfCorrectAnswers;

  Result({required this.numberOfCorrectAnswers});

  Widget resultWords() {
    if (numberOfCorrectAnswers < 3) {
      return Center(
        child: Text(
          "もっと勉強しよう", 
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
          )
        )
      );
    } else if (numberOfCorrectAnswers < 5) {
      return Center(
        child: Text(
          "惜しい！", 
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
          )
        )
      );
    } else {
      return Center(
        child: Text(
          "素晴らしい！", 
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
          )
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.orange),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "5問中$numberOfCorrectAnswers問正解です", 
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                      )
                  )
                )
              ),
              resultWords(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 20.0
                ),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Start()
                      )
                    );
                  }, 
                  child: Text(
                    "初めに戻る",
                    style: TextStyle( 
                      fontSize: 20.0
                    )
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  )
                )
              )
          ])),
    );
  }
}
