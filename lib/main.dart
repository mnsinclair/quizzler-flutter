import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void addAnswerToScoreKeeper(bool buttonClicked) {
    Icon icon;
    bool answer = quizBrain.getQuestionAnswer();
    if (buttonClicked == answer) {
      icon = Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      icon = Icon(
        Icons.close,
        color: Colors.red,
      );
    }
    scoreKeeper.add(icon);
  }

  @override
  Widget build(BuildContext context) {
    Widget result;
    if(quizBrain.questionsRemaining){
      result = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  //The user picked true.
                  setState(() {
                    addAnswerToScoreKeeper(true);
                    quizBrain.nextQuestion();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  setState(() {
                    addAnswerToScoreKeeper(false);
                    quizBrain.nextQuestion();
                  });

                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      );
    } else {
      result = Center(
        child: Text("You are finished!")
      );
    }
    return result;
  }
}

class Check extends StatelessWidget {
  const Check({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {}
}

class Cross extends StatelessWidget {
  const Cross({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }
}
