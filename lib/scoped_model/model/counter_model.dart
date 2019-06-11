import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _count = 0;
  get count => _count;

  void add() {
    _count++;
    // 通知所有的 listener
    notifyListeners();
  }

  CounterModel of(context) => ScopedModel.of<CounterModel>(context);
}
