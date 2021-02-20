import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TextFile Demo',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new MyTextFile(),
    );
  }
}

class MyTextFile extends StatefulWidget {
  @override
  MyTextFileState createState() => new MyTextFileState();
}

class MyTextFileState extends State<MyTextFile> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TextFile demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: new Column(children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              validator: (v) {
                return v.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
              validator: (v) {
                return v.trim().length > 5 ? null : "密码不能小于6位";
              },
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "登录",
        child: Icon(Icons.add),
        onPressed: () {
          if ((_formKey.currentState as FormState).validate()) {
            //验证通过提交数据
            print("login");
          } else {
            print("fail");
          }
        },
      ),
    );
  }
}
