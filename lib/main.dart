import 'package:flutter/material.dart';
import './start_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Demo App",
      home: Scaffold(body: StartScreen()),
    );
  }
}
