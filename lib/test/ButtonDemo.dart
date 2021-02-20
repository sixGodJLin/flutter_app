import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ButtonDemo',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new MyButtonWidget(),
    );
  }
}

class MyButtonWidget extends StatefulWidget {
  @override
  ButtonState createState() => new ButtonState();
}

class ButtonState extends State<MyButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          children: [
            new MyRaiseButton(),
            new MyFlatButton(),
            new MyOutLineButton(),
            new MyIconButton(),
            new MyRaiseButtonWithText(),
            new MyButton()
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text('ButtonDemo'),
      ),
    );
  }
}

class MyRaiseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        onPressed: () {
          print('RaiseButton onpressed');
        },
        child: new Text('RaiseButton'),
      ),
    );
  }
}

class MyFlatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new FlatButton(
        onPressed: () {
          print('FlatButton onpressed');
        },
        child: new Text('FlatButton'),
      ),
    );
  }
}

class MyOutLineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new OutlineButton(
        onPressed: () {
          print('OutlineButton onpressed');
        },
        child: new Text('OutlineButton'),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new IconButton(
        icon: Icon(Icons.thumb_up),
        onPressed: () {
          print('IconButton onpressed');
        },
      ),
    );
  }
}

/// RaiseButton、FlatButton、OutlineButton三者添加图标按钮方式相同
class MyRaiseButtonWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton.icon(
        icon: new Icon(Icons.send),
        label: new Text('MyRaiseButtonWithText'),
        onPressed: () {
          print('MyRaiseButtonWithText onpressed');
        },
      ),
    );
  }
}

//const FlatButton({
//  ...
//  @required this.onPressed, //按钮点击回调
//  this.textColor, //按钮文字颜色
//  this.disabledTextColor, //按钮禁用时的文字颜色
//  this.color, //按钮背景颜色
//  this.disabledColor,//按钮禁用时的背景颜色
//  this.highlightColor, //按钮按下时的背景颜色
//  this.splashColor, //点击时，水波动画中水波的颜色
//  this.colorBrightness,//按钮主题，默认是浅色主题
//  this.padding, //按钮的填充
//  this.shape, //外形
//  @required this.child, //按钮的内容
//})
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {
            print('MyButton onpressed');
          },
          child: new Text('Submit')),
    );
  }
}
