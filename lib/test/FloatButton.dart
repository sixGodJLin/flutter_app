import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  @override
  TestWidgetState createState() => new TestWidgetState();
}

class TestWidgetState extends State<TestWidget> {
  int _count = 0;

  void click() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FloatButton demo'),
      ),
      body: new Center(
        child: new Text('$_count'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: click,
        child: new Icon(Icons.upgrade),
      ),
    );
  }
}

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FloatButton demo',
      home: new TestWidget(),
      theme: new ThemeData(
          primaryColor: Colors.blue
      ),
    );
  }

}
