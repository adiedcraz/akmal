import 'dart:async';

import 'package:akmal/app/modules/program/providers/program_provider.dart';
import 'package:get/get.dart';

import '../models/program_model.dart';

class ProgramController extends GetxController {
  //TODO: Implement ProgramController
  final _programProvider = Get.find<ProgramProvider>();
  final programs = RxList<Program>();
  StreamSubscription? subscription;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    //_programProvider.getPrograms();
    dbFirebase();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    subscription?.cancel();
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> dbFirebase() async {
    subscription?.cancel();
    subscription = _programProvider.getPrograms().listen(
      (event) {
        programs.value = event;
      },
    );
  }
}
