import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BothDetectorRouter(),
      theme: new ThemeData(primaryColor: Colors.blue),
    );
  } 
}

class BothDetectorRouter extends StatefulWidget {
  @override
  BothDetectorRouterState createState() => new BothDetectorRouterState();
}

class BothDetectorRouterState extends State<BothDetectorRouter> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },

              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
            ))
      ],
    );
  }
}
