// @dart=2.9
import 'package:flutter/material.dart';
import 'package:travello/screens/loginpage.dart';

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travello',
      theme: ThemeData(
        accentColor: Colors.grey,
        primarySwatch: Colors.grey,
      ),
        home: const LoginScreen(),
    );
  }
}
