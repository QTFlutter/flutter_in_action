import 'package:flutter/material.dart';
import 'package:inherited_widget/ShareDataWidget.dart';

class TestWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TestWidgetState();

}

class TestWidgetState extends State<TestWidget> {

  @override
  Widget build(BuildContext context) {
    // 使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父或祖先widget中的InheritedWidget改变（updateShouldNotify返回true)时会被调用。
    // 如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
  
}