import 'package:flutter/material.dart';
import 'package:virash_task/screens/feature_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virash Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FeatureScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
