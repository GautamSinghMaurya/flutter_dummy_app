import 'package:demo_flutter_app/architecture/mvc/counter_app/controller/mvc_counter_controller.dart';
import 'package:demo_flutter_app/architecture/mvvm/counter_app/model/mvvm_counter_model.dart';
import 'package:demo_flutter_app/architecture/mvvm/counter_app/viewmodel/mvvm_counter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../viewmodel/mvvm_getx_viewmodel.dart';

class MvvmGetXView extends StatelessWidget {
  final _viewModel = Get.put(MvvmGetXViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM Counter App"),
      ),
      body: Center(
          child: Obx(() => Text('${_viewModel.counterModel.value!.counter.toString()}',
              style: Theme.of(context).textTheme.headlineMedium))),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            color: Colors.redAccent, shape: BoxShape.circle),
        child: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.add),
          onPressed: () {
            _viewModel.counterIncrement();
          },
        ),
      ),
    );
  }
}
