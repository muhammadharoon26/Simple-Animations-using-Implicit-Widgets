import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Container Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column contents
          children: [
            Center(
              child: AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
              ),
            ),
            SizedBox(height: 20), // Add some space between the container and the button
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  final random = Random();
                  _width = random.nextInt(300).toDouble();
                  _height = random.nextInt(300).toDouble();
                  _color = Color.fromRGBO(
                    random.nextInt(256),
                    random.nextInt(256),
                    random.nextInt(256),
                    1,
                  );
                  _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
                });
              },
              child: Icon(Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }
}