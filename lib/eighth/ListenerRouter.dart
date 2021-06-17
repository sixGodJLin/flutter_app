import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListenerRouter(),
      theme: new ThemeData(primaryColor: Colors.blue),
    );
  }
}

class ListenerRouter extends StatefulWidget {
  @override
  _ListenerRouterState createState() => new _ListenerRouterState();
}

class _ListenerRouterState extends State<ListenerRouter> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListenerRouter"),
      ),
      body:
      // ------- first --------
      // Listener(
      //   child: Container(
      //     alignment: Alignment.center,
      //     color: Colors.blue,
      //     width: 300.0,
      //     height: 150.0,
      //     child: Text(_event?.toString() ?? "",
      //         style: TextStyle(color: Colors.white)),
      //   ),
      //   onPointerDown: (PointerDownEvent event) =>
      //       setState(() => _event = event),
      //   onPointerMove: (PointerMoveEvent event) =>
      //       setState(() => _event = event),
      //   onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
      // ),

      // ------- second --------
      // Listener(
      //     child: ConstrainedBox(
      //       // 点击文本内容时才会响应点击事件
      //       constraints: BoxConstraints.tight(Size(300.0, 150.0)),
      //       child: Center(child: Text("Box A")),
      //     ),
      //     // 如果需要整个区域都能被点击，则需要设置下面的内容
      //     //behavior: HitTestBehavior.opaque,
      //     onPointerDown: (event) => print("down A")
      // ),

      // ------- third --------
      // Stack(
      //   children: <Widget>[
      //     Listener(
      //       child: ConstrainedBox(
      //         constraints: BoxConstraints.tight(Size(300.0, 200.0)),
      //         child: DecoratedBox(
      //             decoration: BoxDecoration(color: Colors.blue)),
      //       ),
      //       onPointerDown: (event) => print("down0"),
      //     ),
      //     Listener(
      //       child: ConstrainedBox(
      //         constraints: BoxConstraints.tight(Size(200.0, 100.0)),
      //         child: Center(child: Text("左上角200*100范围内非文本区域点击")),
      //       ),
      //       onPointerDown: (event) => print("down1"),
      //       // behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透,1 2 全都触发"
      //       // 如果behavior值改为HitTestBehavior.opaque，则只会打印"down1"
      //     )
      //   ],
      // ),

      // ------- fourth --------
      Listener(
        child: AbsorbPointer(
          child: Listener(
            child: Container(
              color: Colors.red,
              width: 200.0,
              height: 100.0,
            ),
            onPointerDown: (event)=>print("in"),
          ),
        ),
        onPointerDown: (event)=>print("up"),
      )
    );
  }
}
