import 'package:akmal/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/program_controller.dart';

class ProgramView extends GetView<ProgramController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Program AKMAL'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: controller.dbFirebase,
              icon: Icon(Icons.calendar_month),
            ),
          ],
        ),
        body: Obx(() => ListView.separated(
              itemCount: controller.programs.value.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final program = controller.programs.value[index];
                return ListTile(
                  onTap: () => Get.toNamed(
                    Routes.PROGRAM_DETAIL,
                    arguments: program,
                  ),
                  title: Text(
                    program.date,
                  ),
                  subtitle: Text(
                    program.title.toString(),
                  ),
                );
              },
            )));
  }
}
