import 'package:flutter/material.dart';
import 'package:virash_task/screens/quiz_screen.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  void _goToQuizScreen({
    required BuildContext context,
    required String operation,
  }) {
    print(operation);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizScreen(operation: operation),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Choose Operation",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buttonWidget(
                  operation: "+",
                  onPressed: () => _goToQuizScreen(
                    context: context,
                    operation: "+",
                  ),
                ),
                _buttonWidget(
                  operation: "-",
                  onPressed: () => _goToQuizScreen(
                    context: context,
                    operation: "-",
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buttonWidget(
                  operation: "*",
                  onPressed: () => _goToQuizScreen(
                    context: context,
                    operation: "*",
                  ),
                ),
                _buttonWidget(
                  operation: "/",
                  onPressed: () => _goToQuizScreen(
                    context: context,
                    operation: "/",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget({
    required String operation,
    VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(500),
        ),
        child: Center(
          child: Text(
            "$operation",
            style: TextStyle(
              color: Colors.green,
              fontSize: 120,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
