import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_state_management/scoped_model/model/counter_model.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Second Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('当前数值', style: TextStyle(fontSize: 20.0)),
                Text("${model.count}", style: TextStyle(fontSize: 36.0)),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.add(),
            tooltip: 'add',
            child: Icon(Icons.add),
          ),
        );
      },
//    rebuildOnChange: false,
    );
  }
}
