import 'dart:async';

class MvcCounterModel {
  int _counter = 0;

  final _countStreamController = StreamController<int>();
  Stream<int> get counterStream => _countStreamController.stream;

  void incrementCounter() {
    _counter++;
    _countStreamController.sink.add(_counter);
  }

  void decrement() {
    _counter--;
    _countStreamController.sink.add(_counter);
  }



}