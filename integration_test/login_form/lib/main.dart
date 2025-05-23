import 'package:flutter/material.dart';
import 'package:login_form/login_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Form',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const LoginPage(),
    );
  }
}
