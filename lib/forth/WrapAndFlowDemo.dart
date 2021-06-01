import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHome(),
      theme: new ThemeData(primaryColor: Colors.blue),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("WrapAndFlowDemo")),
      body: new Column(
        children: [new WrapDemo(), new FlowDemo()],
      ),
    );
  }
}

class WrapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      alignment: WrapAlignment.center,
      children: [
        new Chip(
          label: Text('Apple'),
          avatar: new CircleAvatar(
            backgroundColor: Colors.green,
            child: Text('A'),
          ),
        ),
        new Chip(
          label: Text('Banana'),
          avatar: new CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text('B'),
          ),
        ),
        new Chip(
          label: Text('Strawberry'),
          avatar: new CircleAvatar(
            backgroundColor: Colors.red,
            child: Text('S'),
          ),
        ),
        new Chip(
          label: Text('Tomato'),
          avatar: new CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: Text('T'),
          ),
        ),
        new Chip(
          label: Text('Orange'),
          avatar: new CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text('O'),
          ),
        ),
        new Chip(
          label: Text('flutter'),
          avatar: new CircleAvatar(
            backgroundColor: Colors.black,
            child: Text('F'),
          ),
        )
      ],
    );
  }
}

class FlowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.red,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.green,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.blue,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.yellow,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.brown,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
