import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/examples/EventBus.dart';
import 'package:flutterapp/seventh/DialogTest.dart';
import 'package:flutterapp/seventh/FutureBuilder.dart';
import 'package:flutterapp/seventh/InheritedWidget.dart';
import 'package:flutterapp/seventh/ProviderTestRoute.dart';
import 'package:flutterapp/seventh/StreamBuilder.dart';
import 'package:flutterapp/seventh/ThemeRoute.dart';
import 'package:flutterapp/sixth/CustomScrollViewDemo.dart';
import 'package:flutterapp/sixth/ScrollControlDemo.dart';
import 'package:flutterapp/sixth/ScrollNotificationTestRoute.dart';
import 'package:flutterapp/seventh/WillPopScopeTestRoute.dart';

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
      routes: {
        "new_page": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "custom_scroll": (context) {
          return CustomScrollViewTestRouter();
        },
        "scroll_control": (context) {
          return ScrollControllerTestRoute();
        },
        "scroll_notification": (context) {
          return ScrollNotificationTestRoute();
        },
        "WillPopScopeTest": (context) {
          return WillPopScopeTestRoute();
        },
        "InheritedWidget": (context) {
          return InheritedWidgetTestRoute();
        },
        "ProviderRoute": (context) {
          return ProviderRoute();
        },
        "ThemeDataRouter": (context) {
          return ThemeDataRouter();
        },
        "FutureRouter": (context) {
          return FutureRouter();
        },
        "StreamBuilderRouter": (context) {
          return StreamBuilderRouter();
        },
        "MyDialogTestRouter": (context) {
          return MyDialogTestRouter();
        },
        "/": (context) => MyCount(title: "Router Demo")
      },
    );
  }
}

class MyCount extends StatefulWidget {
  final String title;

  MyCount({Key key, this.title}) : super(key: key);

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
    var bus = new EventBus();

    bus.on("eventName", (arg) {
      print("这是回调");
    });

    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text('你可以点击按钮多次'),
            new Text('count: $count',
                style: Theme.of(context).textTheme.headline4),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("new_page", arguments: "JLin");
              },
              child: new Text('打卡提示页'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("custom_scroll", arguments: "JLin");
              },
              child: new Text('打开SustomScroll页面'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("scroll_control");
              },
              child: new Text('打开ScrollControl页面'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("scroll_notification");
              },
              child: new Text('打开ScrollNotificationTest页面'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("WillPopScopeTest");
              },
              child: new Text('打开WillPopScopeTestRoute页面'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("InheritedWidget");
              },
              child: new Text('打开InheritedWidgetTestRoute页面'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("ProviderRoute");
              },
              child: new Text('打开ProviderRoute页面'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("ThemeDataRouter");
              },
              child: new Text('打开ThemeDataRouter页面'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("FutureRouter");
              },
              child: new Text('打开FutureRouter页面'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("StreamBuilderRouter");
              },
              child: new Text('打开StreamBuilderRouter页面'),
              textColor: Colors.blue,
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("MyDialogTestRouter");
              },
              child: new Text('打开MyDialogTestRouter页面'),
              textColor: Colors.blue,
            ),
            new RandomWord()
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: increase,
        tooltip: 'increase',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class MyRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyRouter'),
      ),
      body: new Center(
        child: new Text('This is new Router'),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  var bus = new EventBus();
  final String text;

  TipRoute({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('提示'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Text(text),
              RaisedButton(
                  onPressed: () => {
                        bus.emit("eventName"),
                        Navigator.pop(context, "我是返回值"),
                      },
                  child: new Text("返回"))
            ],
          ),
        ),
      ),
    );
  }
}

class RandomWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
        padding: EdgeInsets.all(8), child: new Text(wordPair.toString()));
  }
}
