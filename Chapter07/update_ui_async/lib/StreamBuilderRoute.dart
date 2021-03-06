import 'package:flutter/material.dart';

class StreamBuilderRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => StreamBuilderRouteState();

}

class StreamBuilderRouteState extends State<StreamBuilderRoute> {

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilder"),
      ),
      body: StreamBuilder<int>(
        stream: counter(),
        // initialData:, // a Stream<int> or null
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("没有Stream");
            case ConnectionState.waiting:
              return Text("等待数据...");
            case ConnectionState.active:
              return Text("active: ${snapshot.data}");
            case ConnectionState.done:
              return Text("Stream已关闭");
          }
          return null;  // unreachable
        },
      ),
    );
  }

}