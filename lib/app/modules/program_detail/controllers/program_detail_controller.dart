import 'package:add_2_calendar/add_2_calendar.dart';
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

  void onSubmitCalendar() {
    final Event event = Event(
      title: program.value!.title ?? '',
      description: program.value!.coordinator!.join(','),
      location: program.value!.location ?? '',
      startDate: program.value!.startDate!,
      endDate: program.value!.endDate!,
      // iosParams: IOSParams(
      //   reminder: Duration(/* Ex. hours:1 */), // on iOS, you can set alarm notification after your event.
      //   url: 'https://www.example.com', // on iOS, you can set url to your event.
      // ),
      // androidParams: AndroidParams(
      //   emailInvites: [], // on Android, you can add invite emails to your event.
      // ),
    );

    Add2Calendar.addEvent2Cal(event);
  }
}
