import 'package:get/get.dart';

import '../../program/models/program_model.dart';

class ProgramDetailController extends GetxController {
  //TODO: Implement ProgramDetailController
  final program = Rx<Program?>(null);

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    program.value = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
