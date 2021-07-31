import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virash_task/screens/options_screen.dart';

class FeatureScreen extends StatelessWidget {
  void _goToOptionsScreen({
    required BuildContext context,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OptionsScreen(),
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
            _featureButton("Play", () => _goToOptionsScreen(context: context)),
            SizedBox(height: 30),
            _featureButton("Options", () {}),
            SizedBox(height: 30),
            _featureButton("Exit", () {
              SystemNavigator.pop();
            }),
          ],
        ),
      ),
    );
  }

  Widget _featureButton(String buttonText, VoidCallback onPressed) {
    return MaterialButton(
      height: 100,
      minWidth: 300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 40,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
