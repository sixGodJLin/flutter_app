import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('ContainerDemo'),
      ),
      body: new Container(
        margin: EdgeInsets.only(top: 50, left: 120),
        constraints: BoxConstraints.tightFor(width: 150.0, height: 150.0),
        decoration: BoxDecoration(
          gradient: RadialGradient(
              //背景径向渐变
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: 0.98),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0)
          ],
        ),
        transform: Matrix4.rotationZ(0.2),
        alignment: Alignment.center,
        // 卡片文字居中
        child: Text(
          '5.20',
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      ),
    );
  }
}
