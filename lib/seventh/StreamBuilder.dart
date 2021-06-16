import 'package:flutter/material.dart';

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    print("$i");
    return i;
  });
}

class StreamBuilderRouter extends StatefulWidget {
  @override
  StreamBuilderRouterState createState() => new StreamBuilderRouterState();
}

class StreamBuilderRouterState extends State<StreamBuilderRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FutureRouter"),
        ),
        body: StreamBuilder(
            stream: counter(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('没有Stream');
                case ConnectionState.waiting:
                  return Text('等待数据...');
                case ConnectionState.active:
                  return Text('active: ${snapshot.data}');
                case ConnectionState.done:
                  return Text('Stream已关闭');
              }
              return null; // unreachable
            }));
  }
}
