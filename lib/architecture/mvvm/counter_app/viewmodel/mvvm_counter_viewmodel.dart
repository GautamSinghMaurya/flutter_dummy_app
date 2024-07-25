import 'dart:async';

import '../model/mvvm_counter_model.dart';

class MvvmCounterViewModel {
  MvvmCounterModel _mvvmCounterModel = MvvmCounterModel();
  final streamController = StreamController<MvvmCounterModel>();
  Stream<MvvmCounterModel> get streamCounter => streamController.stream;


  void counterIncrement() {
    _mvvmCounterModel.counter++;
    streamController.sink.add(_mvvmCounterModel);
  }

  void counterDecrement() {
    _mvvmCounterModel.counter--;
    streamController.sink.add(_mvvmCounterModel);
  }

}
