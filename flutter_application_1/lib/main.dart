import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedContainerDemo(),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double _height = 100.0;
  double _width = 100.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  bool _isVisible = true;

  void _animateContainer() {
    setState(() {
      _height = _height == 100.0 ? 50.0 : 200.0;
      _width = _width == 100.0 ? 50.0 : 200.0;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
      _borderRadius = _borderRadius == BorderRadius.circular(8) 
          ? BorderRadius.circular(30) 
          : BorderRadius.circular(8);
    });
  }

  void _toggleTextVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple-Animations-using-Implicit-Widgets'
          ),
          centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
            ),
            SizedBox(height: 50),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text(
                'Implicit Widget',
                style: TextStyle(
                  fontSize: 16
                  ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _animateContainer();
                _toggleTextVisibility();
              },
              child: Text('Click To Toggle Text Visibility!'),
            ),
          ],
        ),
      ),
    );
  }
}