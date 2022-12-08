import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant.dart';
import '../../auth/controllers/auth_controller.dart';

class FormWidget extends GetView<AuthController> {
  const FormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Email',
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              onChanged: controller.onEmailChanged,
              validator: controller.emailValidator,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Obx(() => TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isHidePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    hintText: 'Kata Laluan',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    suffixIcon: IconButton(
                      onPressed: controller.toggleShowPassword,
                      icon: Icon(
                        controller.isHidePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  onChanged: controller.onPwordChanged,
                  validator: controller.passwordValidator,
                )),
          ),
        ],
      ),
    );
  }
}
