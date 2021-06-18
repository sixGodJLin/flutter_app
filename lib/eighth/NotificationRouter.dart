import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationRouter(),
      theme: new ThemeData(primaryColor: Colors.blue),
    );
  }
}

class NotificationRouter extends StatefulWidget {
  @override
  NotificationRouterState createState() => new NotificationRouterState();
}

// class NotificationRouterState extends State<NotificationRouter> {
//   String _msg = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<MyNotification>(
//       onNotification: (notification) {
//         setState(() {
//           _msg += notification.msg + "";
//         });
//         return true;
//       },
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Builder(builder: (context) {
//               return RaisedButton(onPressed: () {
//                 MyNotification("Hi").dispatch(context);
//               },
//                 child: Text("send notification"),
//               );
//             }),
//             Text(_msg)
//           ],
//         ),
//       ),
//     );
//   }
// }

class NotificationRouterState extends State<NotificationRouter> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        print(notification.msg);
        return false;
      },
      child: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "";
          });
          return true;
          // return false; // 通知会传递到上一层（冒泡原理）
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                return RaisedButton(
                  onPressed: () {
                    MyNotification("Hi").dispatch(context);
                  },
                  child: Text("send notification"),
                );
              }),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}
