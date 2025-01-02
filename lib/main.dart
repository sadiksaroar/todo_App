import 'package:flutter/material.dart';
import 'package:todo/home_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.amber,
      home: HomePage(),
    );
  }
}
