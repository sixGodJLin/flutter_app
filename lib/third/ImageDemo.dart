import 'package:flutter/material.dart';

//const Image({
//  ...
//  this.width, //图片的宽
//  this.height, //图片高度
//  this.color, //图片的混合色值
//  this.colorBlendMode, //混合模式
//  this.fit,//缩放模式
//  this.alignment = Alignment.center, //对齐方式
//  this.repeat = ImageRepeat.noRepeat, //重复方式
//  ...
//})

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: [
          new MyImage(),
          new MyNetWorkImage(),
        ],
      ),
      appBar: new AppBar(
        title: Text('ImageDemo'),
      ),
    );
  }
}

//Image.asset("images/avatar.png",
//  width: 100.0,
//)
class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Image(
        image: AssetImage("images/lakes.png"),
        width: 100,
      ),
    );
  }
}

//Image.network(
//  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//  width: 100.0,
//)
class MyNetWorkImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Image(
        image: NetworkImage(
            "https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/241f95cad1c8a7863cb5bacd6709c93d71cf5052.jpg"),
        width: 100,
      ),
    );
  }
}
