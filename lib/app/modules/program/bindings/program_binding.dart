import 'package:akmal/app/modules/program/providers/program_provider.dart';
import 'package:get/get.dart';

import '../controllers/program_controller.dart';

class ProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramController>(
      () => ProgramController(),
    );

    Get.lazyPut<ProgramProvider>(
      () => ProgramProvider(),
    );
  }
}
