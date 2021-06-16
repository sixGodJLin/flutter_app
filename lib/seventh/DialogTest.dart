import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Future<T> showGeneralDialog<T>({
//   @required BuildContext context,
//   @required RoutePageBuilder pageBuilder, //构建对话框内部UI
//   bool barrierDismissible, //点击遮罩是否关闭对话框
//   String barrierLabel, // 语义化标签(用于读屏软件)
//   Color barrierColor, // 遮罩颜色
//   Duration transitionDuration, // 对话框打开/关闭的动画时长
//   RouteTransitionsBuilder transitionBuilder, // 对话框打开/关闭的动画
// })

class MyDialogTestRouter extends StatefulWidget {
  @override
  MyDialogTestRouterState createState() => new MyDialogTestRouterState();
}

class MyDialogTestRouterState extends State<MyDialogTestRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyDialogTestRouter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("对话框1"),
              onPressed: () async {
                //弹出对话框并等待其关闭
                bool delete = await showDeleteConfirmDialog1();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                }
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("对话框2"),
              onPressed: () async {
                changeLanguage();
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("列表对话框"),
              onPressed: () {
                showListDialog();
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("custom对话框"),
              onPressed: () {
                showCustomDialog(context: context);
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("提示框（带复选框）"),
              onPressed: () async {
                bool deleteTree = await showDeleteConfirmDialogWithCheckBox();
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $deleteTree");
                }
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("底部菜单弹窗"),
              onPressed: () async {
                int type = await _showModalBottomSheet();
                print("$type");
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("底部全屏菜单弹窗"),
              onPressed: () async {
                _showBottomSheet();
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("loading1"),
              onPressed: () async {
                showLoadingDialog();
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("loading2"),
              onPressed: () async {
                showMyLoadingDialog();
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("datePick1"),
              onPressed: () async {
                DateTime time = await _showDatePicker1();
                print("$time");
              },
              textColor: Colors.blue,
            ),
            RaisedButton(
              child: Text("datePick2"),
              onPressed: () async {
                DateTime time = await _showDatePicker2();
                print("$time");
              },
              textColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  // 选择对话框
  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  // 列表对话框
  Future<void> showListDialog() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          var child = Column(
            children: [
              ListTile(title: Text("请选择")),
              Expanded(
                  child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("$index"),
                          onTap: () => Navigator.of(context).pop(index),
                        );
                      }))
            ],
          );
          return Dialog(child: child);
        });
    if (i != null) {
      print("点击了: $i");
    }
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  Future<bool> showDeleteConfirmDialogWithCheckBox() {
    bool _withTree = false;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("确定删除文件？"),
                Row(
                  children: [
                    Text("同时删除子目录"),
                    // ---------- first --------
                    // DialogCheckBox(
                    //     value: _withTree,
                    //     onChanged: (bool value) {
                    //       _withTree = !_withTree;
                    //     })

                    // ---------- second --------
                    // StatefulBuilder(
                    //   builder: (context, _setState) {
                    //     return Checkbox(
                    //       value: _withTree, //默认不选中
                    //       onChanged: (bool value) {
                    //         //_setState方法实际就是该StatefulWidget的setState方法，
                    //         //调用后builder方法会重新被调用
                    //         _setState(() {
                    //           //更新选中状态
                    //           _withTree = !_withTree;
                    //         });
                    //       },
                    //     );
                    //   },
                    // ),

                    // ---------- third --------
                    // Checkbox(
                    //   // 依然使用Checkbox组件
                    //   value: _withTree,
                    //   onChanged: (bool value) {
                    //     // 此时context为对话框UI的根Element，我们
                    //     // 直接将对话框UI对应的Element标记为dirty
                    //     (context as Element).markNeedsBuild();
                    //     _withTree = !_withTree;
                    //   },
                    // ),

                    // ---------- forth --------
                    Builder(
                      builder: (BuildContext context) {
                        return Checkbox(
                          value: _withTree,
                          onChanged: (bool value) {
                            (context as Element).markNeedsBuild();
                            _withTree = !_withTree;
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
            actions: [
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  // 将选中状态返回
                  Navigator.of(context).pop(_withTree);
                },
              ),
            ],
          );
        });
  }

  // 弹出底部菜单列表模态对话框
  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  // 返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet() {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                // do something
                print("$index");
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }

  // loading
  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }

  // loading
  showMyLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(
                    value: .8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<DateTime> _showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        Duration(days: 30),
      ),
    );
  }

  Future<DateTime> _showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }
}

class DialogCheckBox extends StatefulWidget {
  DialogCheckBox({Key key, this.value, @required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  _DialogCheckBoxState createState() => new _DialogCheckBoxState();
}

class _DialogCheckBoxState extends State<DialogCheckBox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: value,
        onChanged: (v) {
          widget.onChanged(v);
          setState(() {
            value = v;
          });
        });
  }
}

class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}
