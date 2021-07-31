import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virash_task/models/question_answer.dart';
import 'package:virash_task/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String operation;

  const QuizScreen({
    required this.operation,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  int score = 0;
  double answer = 0;
  bool timeOver = false;

  @override
  void initState() {
    generateList();
    super.initState();
  }

  void _setAnswer(int number1, int number2) {
    if (widget.operation == "+") {
      _addition(number1, number2);
    } else if (widget.operation == "-") {
      _subtraction(number1, number2);
    } else if (widget.operation == "*") {
      _multiplication(number1, number2);
    } else if (widget.operation == "/") {
      _division(number1, number2);
    }
  }

  void _setScore(BuildContext context, double answerChosen) {
    if (answerChosen == answer) {
      setState(() {
        questionIndex++;
        score += 5;
      });
    } else {
      _showAlertDialog(context);
    }
  }

  void _addition(int number1, int number2) {
    answer = (number1 + number2).toDouble();
  }

  void _subtraction(int number1, int number2) {
    answer = (number1 - number2).toDouble();
  }

  void _multiplication(int number1, int number2) {
    answer = (number1 * number2).toDouble();
  }

  void _division(int number1, int number2) {
    answer = double.parse((number1 / number2).toStringAsFixed(2));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: Text(
            "Oops!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          content: Text(
            "Wrong Answer",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  questionIndex = 0;
                  answer = 0;
                  score = 0;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                "Try Again",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  questionIndex++;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                "Skip This Question",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return questionIndex >= data.length || timeOver
        ? ResultScreen(questionLength: data.length, score: score)
        : Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Score : $score"),
                  Container(
                    width: 55.0,
                  ),
                  Icon(Icons.timer),
                  TweenAnimationBuilder<Duration>(
                      duration: Duration(minutes: 5, seconds: 30),
                      tween: Tween(
                          begin: Duration(minutes: 5, seconds: 20),
                          end: Duration.zero),
                      onEnd: () {
                        print('Timer ended');
                        setState(() {
                          timeOver = true;
                        });
                      },
                      builder: (BuildContext context, Duration value,
                          Widget? child) {
                        final minutes = value.inMinutes;
                        final seconds = value.inSeconds % 60;
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text('$minutes:$seconds',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)));
                      })
                ],
              ),
            ),
            body: Stack(
              children: <Widget>[
                Image.asset("assets/images/Math wallpaper.jpg",
                    fit: BoxFit.fill),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (questionIndex < data.length)
                      Text(
                        "${data[questionIndex].number1} ${widget.operation} ${data[questionIndex].number2} = ?",
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.green,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    SizedBox(height: 50),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            if (questionIndex < data.length)
                              _optionButton(data[questionIndex].options[0], () {
                                _setAnswer(data[questionIndex].number1,
                                    data[questionIndex].number2);
                                _setScore(
                                    context, data[questionIndex].options[0]);
                              }),
                            if (questionIndex < data.length)
                              _optionButton(data[questionIndex].options[1], () {
                                _setAnswer(data[questionIndex].number1,
                                    data[questionIndex].number2);
                                _setScore(
                                    context, data[questionIndex].options[1]);
                              }),
                          ],
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            if (questionIndex < data.length)
                              _optionButton(data[questionIndex].options[2], () {
                                _setAnswer(data[questionIndex].number1,
                                    data[questionIndex].number2);
                                _setScore(
                                    context, data[questionIndex].options[2]);
                              }),
                            if (questionIndex < data.length)
                              _optionButton(data[questionIndex].options[3], () {
                                _setAnswer(data[questionIndex].number1,
                                    data[questionIndex].number2);
                                _setScore(
                                    context, data[questionIndex].options[3]);
                              }),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Widget _optionButton(double option, VoidCallback onPressed) {
    return MaterialButton(
      color: Colors.green,
      height: 100,
      minWidth: 150,
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Text(
        "$option",
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
