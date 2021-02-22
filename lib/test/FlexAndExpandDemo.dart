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
      appBar: new AppBar(
        title: Text('FlexAndExpandDemo'),
      ),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 100.0,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.red,
                        )),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 30.0,
                          color: Colors.green,
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
