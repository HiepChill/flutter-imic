import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.grey,
    Colors.purple,
  ];

  Color backgroundColor = Colors.white;

  void increase() {
    setState(() {
      count ++;
      if (count % 2 == 0) {
        backgroundColor = colors[Random().nextInt(colors.length)];
      } 
      else {
        backgroundColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$count',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: increase,
                child: Text(
                  'Tap Me',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                child: Text(
                  'Hi' , style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    backgroundColor: Colors.white
                  ),
                ),
                onPressed: increase,
              )
            ],
          ),
        ),
      ),
    );
  }
}
