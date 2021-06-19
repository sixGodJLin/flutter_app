import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaleAnimationWithListenerRouter(),
      theme: new ThemeData(primaryColor: Colors.blue),
    );
  }
}

// ---- 普通缩放动画 ----
class ScaleAnimationRouter extends StatefulWidget {
  ScaleAnimationRouterState createState() => new ScaleAnimationRouterState();
}

class ScaleAnimationRouterState extends State<ScaleAnimationRouter>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 6), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // 图片宽度从0-300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    // 启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "../images/lakes.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  @override
  void dispose() {
    // 销毁时释放动画资源
    controller.dispose();
    super.dispose();
  }
}
// ---- 普通缩放动画 end ----

// ---- 使用AnimatedWidget 缩放动画 ----
class AnimateImage extends AnimatedWidget {
  AnimateImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset("../images/lakes.png",
          width: animation.value, height: animation.value),
    );
  }
}

class ScaleAnimationRouter1 extends StatefulWidget {
  ScaleAnimationRouterState1 createState() => new ScaleAnimationRouterState1();
}

class ScaleAnimationRouterState1 extends State<ScaleAnimationRouter1>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 6), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateImage(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
// ---- 使用AnimatedWidget 缩放动画 end ----

// ---- 使用AnimatedBuilder 缩放动画 ----
class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class ScaleAnimationRouter2 extends StatefulWidget {
  ScaleAnimationRouterState2 createState() => new ScaleAnimationRouterState2();
}

class ScaleAnimationRouterState2 extends State<ScaleAnimationRouter2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 6), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: Image.asset("../images/lakes.png"),
      animation: animation,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
// ---- 使用AnimatedBuilder 缩放动画 end ----

// ---- 普通缩放动画带监听 ----
class ScaleAnimationWithListenerRouter extends StatefulWidget {
  ScaleAnimationWithListenerRouterState createState() =>
      new ScaleAnimationWithListenerRouterState();
}

class ScaleAnimationWithListenerRouterState
    extends State<ScaleAnimationWithListenerRouter>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 6), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    animation.addStatusListener((status) {
      print("$status");
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    // 启动动画(正向)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "../images/lakes.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  @override
  void dispose() {
    // 销毁时释放动画资源
    controller.dispose();
    super.dispose();
  }
}
// ---- 普通缩放动画带监听 end ----
