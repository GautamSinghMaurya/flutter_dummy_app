import 'package:demo_flutter_app/architecture/mvvm_with_provider/model/mvvm_getx_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MvvmGetXViewModel extends GetxController {
  Rxn<MvvmGetXModel> counterModel = Rxn<MvvmGetXModel>(MvvmGetXModel(0));

  void counterIncrement() {

    int data = counterModel.value!.counter;
    data++;
    print(data);
    counterModel.value = MvvmGetXModel(counterModel.value!.counter++);
    print(counterModel.value!.counter);
  }

}