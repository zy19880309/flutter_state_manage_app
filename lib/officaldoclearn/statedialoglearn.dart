import 'package:flutter/material.dart';

class StatefulDialogRoute extends StatefulWidget {
  @override
  _StatefulDialogRouteState createState() => _StatefulDialogRouteState();
}

class _StatefulDialogRouteState extends State<StatefulDialogRoute> {
  bool withTree = false; // 复选框选中状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("对话框2"),
          onPressed: () async {
            bool delete = await showDeleteConfirmDialog2();
            if (delete == null) {
              print("取消删除");
            } else {
              print("同时删除子目录: $delete");
            }
          },
        ),
        RaisedButton(
          child: Text("底部弹出dialog"),
          onPressed: () async {
            int index = await _showModalBottomSheet();
            print("点击了$index");
          },
        ),
      ],
    );
  }

  Future<bool> showDeleteConfirmDialog2() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool value) {
                          //复选框选中状态发生变化时重新构建UI
                          //更新复选框状态
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("项目$index"),
                onTap: () {
                  Navigator.of(context).pop(index);
                },
              );
            },
          );
        });
  }
}
