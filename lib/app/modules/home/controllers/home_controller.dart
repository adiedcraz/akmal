import 'dart:io';

import 'package:akmal/app/modules/home/views/qr_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../auth/providers/auth_provider.dart';
import '../models/menu.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final _authProvider = Get.find<AuthProvider>();
  final menus = [
    Menu(
      title: 'Takwim',
      icon: Icons.calendar_month,
      onPressed: () {
        Get.toNamed(Routes.PROGRAM);
      },
    ),
    Menu(
      title: 'AKMAL2U',
      icon: Icons.school,
      onPressed: () {
        print('go to AKMAL2U');
      },
    ),
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void logout() {
    _authProvider.logout();
  }

  void qrscanner() {
    Get.to(QRViewExample());
  }

  Future<void> fileUpload() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    final path = result?.files.single.path;

    if (path != null) {
      File file = File(path);
    } else {
      // User canceled the picker
    }
  }

  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  }
}
