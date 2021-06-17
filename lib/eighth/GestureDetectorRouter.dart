import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetectorRouter(),
      theme: new ThemeData(primaryColor: Colors.blue),
    );
  }
}

//---- 点击事件 -----
class GestureDetectorRouter extends StatefulWidget {
  @override
  _GestureDetectorRouterState createState() =>
      new _GestureDetectorRouterState();
}

class _GestureDetectorRouterState extends State<GestureDetectorRouter> {
  String _operation  = "no Gesture detected";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListenerRouter"),
        ),
        body: Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200,
              height: 100,
              child: Text(
                _operation ,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => update("onTap"),
            onDoubleTap: () => update("onDoubleTap"),
            onLongPress: () => update("onLongPress"),
          ),
        ));
  }

  void update(String string) {
    setState(() {
      _operation  = string;
    });
  }
}
//---- 点击事件 end ----


class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();

}

class _DragState extends State<_Drag> {
  double _top = 0.0;
  double left = 0.0;

  @override
  Widget build(BuildContext context) {
    
  }
}
