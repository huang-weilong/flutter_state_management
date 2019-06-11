import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_state_management/scoped_model/model/counter_model.dart';

import 'second_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //静态获取model用法实例
  Model _getModel(BuildContext context) {
    //直接使用of
    final countModel = ScopedModel.of<CounterModel>(context);
    //使用CountModel中重写的of
    final countModel2 = CounterModel().of(context);

    countModel.add();
//    countModel2.add();
    return countModel;
//    return countModel2;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home Page'),
            elevation: 0.0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  model.count.toString(),
                  style: TextStyle(fontSize: 48.0),
                ),
                RaisedButton(
                  child: Text('加（方法1）'),
                  onPressed: () {
                    model.add();
                  },
                ),
                RaisedButton(
                  child: Text('加（方法2）'),
                  onPressed: () {
                    _getModel(context);
                  },
                ),
                RaisedButton(
                  child: Text('页面跳转'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
