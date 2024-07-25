import 'dart:async';

import 'package:demo_flutter_app/architecture/mvc/counter_app/model/mvc_counter_model.dart';

class MvcCounterController {
  final MvcCounterModel _model = MvcCounterModel();
  Stream<int> get counterStream => _model.counterStream;

  void incrementCounter() {
    _model.incrementCounter();
  }

  void decrement() {
    _model.decrement();
  }

}