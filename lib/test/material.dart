import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new CountIncrease(),
  ));
}

class CountIncrease extends StatefulWidget {
  @override
  createState() => Count();
}

class Count extends State<CountIncrease> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: click,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: click,
          ),
        ],
      ),
      //body占屏幕的大部分
      body: new Center(
        child: new Text('count: $_counter'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: click,
      ),
    );
  }

  void click() {
    setState(() {
      _counter++;
    });
  }
}
