import 'package:get/get.dart';

class MvvmGetXModel {
  int _counter = 0;

  MvvmGetXModel(this._counter);

  int get counter => _counter;

  set counter(value) => _counter = value;

}