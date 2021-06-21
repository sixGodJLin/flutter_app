import 'package:flutter/material.dart';

// 自定义路由切换动画
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: new ThemeData(primaryColor: Colors.blue),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RouterAnimateRouter"),
      ),
      body: AnimatedSwitchRouter(),
    );
  }
}

class AnimatedSwitchRouter extends StatefulWidget {
  const AnimatedSwitchRouter({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _AnimateSwitchRouterState();
}

class _AnimateSwitchRouterState extends State<AnimatedSwitchRouter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Text(
              "$_count",
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          RaisedButton(
              child: Text("+1"),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              })
        ],
      ),
    );
  }
}
