import 'package:demo_flutter_app/architecture/mvc/counter_app/controller/mvc_counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MvcCounter extends StatelessWidget {
  final _controller = MvcCounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVC Counter App"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _controller.counterStream,
          initialData: 0,
          builder: (context, snapshot) {
            return Text('${snapshot.data}', style: Theme.of(context).textTheme.headlineMedium);
          },
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            color: Colors.redAccent, shape: BoxShape.circle),
        child: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.add),
          onPressed: () {
            _controller.incrementCounter();
          },
        ),
      ),
    );
  }
}
