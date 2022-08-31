import 'package:flutter/material.dart';
import 'package:snapchat_ui/Screen/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snapchat UI',
      theme: ThemeData(),
      home: const AuthScreen(),
    );
  }
}
