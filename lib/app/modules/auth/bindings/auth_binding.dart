import 'package:akmal/app/modules/auth/providers/auth_provider.dart';
import 'package:akmal/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );

    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
    );
  }
}
