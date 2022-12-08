import 'dart:async';

import 'package:akmal/app/modules/auth/providers/auth_provider.dart';
import 'package:akmal/app/modules/auth/views/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../user/providers/user_provider.dart';
import '../models/auth_model.dart';
import '../views/phone_view.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final _authProvider = Get.find<AuthProvider>();
  final _userProvider = Get.find<UserProvider>();
  final auth = Rx<Auth>(Auth());
  final formKey = GlobalKey<FormState>();
  final formPhoneKey = GlobalKey<FormState>();
  StreamSubscription? subscription;
  final count = 0.obs;
  final code = ''.obs;

  final passwordVisibleState = false.obs;

  bool get isHidePassword => passwordVisibleState.isFalse;

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void onEmailChanged(String value) {
    auth.value.email = value;
  }

  void onPwordChanged(String value) {
    auth.value.password = value;
  }

  void checkAuth() {
    subscription?.cancel();
    subscription = _authProvider.getAuthState().listen((isLoggin) {
      if (isLoggin) {
        _userProvider.getFCMToken();
        Get.toNamed(Routes.HOME);
      } else {
        Get.toNamed(Routes.AUTH);
      }
    });
  }

  String? emailValidator(String? value) {
    if (value == null) return 'Email is required';
    if (value.isEmpty) return 'Email is required';
    if (!GetUtils.isEmail(value)) return 'Email not valid';

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null) return 'Password is required';
    if (value.isEmpty) return 'Password is required';
    if (GetUtils.isLengthLessThan(value, 6)) {
      return 'Password must more than 6 character';
    }

    return null;
  }

  Future<void> onSubmit() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == null) return;
    if (!isValid) return;

    try {
      // print(user.value.toJson());
      await _authProvider.login(auth.value);
    } catch (e) {
      Get.snackbar('Unable to login', e.toString());
    }
  }

  void toggleShowPassword() {
    passwordVisibleState.value = !passwordVisibleState.value;
  }

  Future<void> onGoogle() async {
    try {
      await _authProvider.signInWithGoogle();
    } catch (e) {
      Get.snackbar('Unable to login', e.toString());
    }
  }

  Future<void> onFacebook() async {
    try {
      await _authProvider.signInWithFacebook();
    } catch (e) {
      Get.snackbar('Unable to login', e.toString());
    }
  }

  void onOTP() {
    Get.to(PhoneView());
  }

  Future<void> onSubmitOTP() async {
    try {
      print(auth.value.toJson());
      await _authProvider.signInWithPhone(auth.value, onReceiveCode: () async {
        final OTPcode = await Get.to(() => OtpView());
        print('otpcode $OTPcode');
        return OTPcode;
      }, onTimeOut: () {
        Get.snackbar('Unable to login', 'Time Out');
      });
    } catch (e) {
      Get.snackbar('Unable to login', e.toString());
    }
  }

  void onPhoneChanged(String value) {
    auth.value.phone = value;
  }

  String? phoneValidator(String? value) {}

  void onOTPChanged(String value) {
    code.value = value;
  }

  void onSubmitOTPCode() {
    Get.back(result: code.value);
  }
}
