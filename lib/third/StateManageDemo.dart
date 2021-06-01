import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/*
 * -----------tapA-----------------
 */
class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  _TapBoxAState createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Avtive A' : 'InActive A',
            style: new TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}
// -----------tapA end-----------------

/*
 *-----------tapB-----------------
 */
class ParentBWidget extends StatefulWidget {
  @override
  _ParentBWidgetState createState() => new _ParentBWidgetState();
}

class _ParentBWidgetState extends State<ParentBWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapBoxB(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  TapBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active B' : 'Inactive B',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
// -----------tapB end-----------------

/*
 *-----------tapC-----------------
 */
class ParentCWidget extends StatefulWidget {
  @override
  _ParentCWidgetState createState() => new _ParentCWidgetState();

}

class _ParentCWidgetState extends State<ParentCWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapBoxC(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }

}

class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, this.active = false, @required this.onChanged})
      :super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  TapBoxCState createState() => new TapBoxCState();
}

class TapBoxCState extends State<TapBoxC> {
  bool _highLight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highLight = true;
    });
  }

  void _handleTapUp(TapUpDetails  details) {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active C' : 'Inactive C',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color:
          widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highLight
              ? new Border.all(
            color: Colors.teal[700],
            width: 10.0,
          )
              : null,
        ),
      ),
    );
  }
}
// -----------tapC end-----------------

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'StateManage Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('StateManage Demo'),
        ),
        body: new Center(
          child: ParentCWidget(),
        ),
      ),
    );
  }
}

void main() {
  runApp(new MyApp());
}
