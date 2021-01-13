import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Counter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyCount(),
    );
  }
}

class MyCount extends StatefulWidget {
  @override
  _MyCountState createState() => new _MyCountState();
}

class _MyCountState extends State<MyCount> {
  int count = 0;

  void increase() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Counter Demo')
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text('你可以点击按钮多次'),
            new Text('count: $count', style: Theme
                .of(context)
                .textTheme
                .headline4)
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: increase,
        tooltip: 'increase',
        child: new Icon(Icons.add),),
    );
  }
}
