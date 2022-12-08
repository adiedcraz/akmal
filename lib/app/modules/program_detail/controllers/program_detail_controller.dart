import 'package:device_calendar/device_calendar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import '../../program/models/program_model.dart';
import 'package:timezone/standalone.dart' as tz;

class ProgramDetailController extends GetxController {
  //TODO: Implement ProgramDetailController

  final program = Rx<Program?>(null);
  String get title => program.value?.title ?? 'Program';
  //bool get isSameDay => program.value?.isSameDay ?? false;
  String get date => program.value?.date ?? '';
  String get dateStart => program.value?.startDateFormatted ?? '';
  String get dateEnd => program.value?.endDateFormatted ?? '';
  String get time => program.value?.time ?? '';
  String get location => program.value?.location ?? '';
  List<String> get coordinators => program.value?.coordinator ?? [];

  final _deviceCalendarPlugin = DeviceCalendarPlugin();
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

  Future<void> onSubmitCalendar() async {
    try {
      final startDate = program.value!.startDate!;
      final endDate = program.value!.endDate!;
      //if (!isSameDay && startDate.isAfter(endDate)) throw 'Invalid date range';

      Calendar? calendar = await getCalendarAccount();
      if (calendar == null) return;

      Availability? availability = await getAvailbility();
      if (availability == null) return;

      tz.Location currentLocation = await getTimezoneLocation();

      final event = Event(
        calendar.id,
        title: title,
        description: 'Event description of $title',
        location: location,
        start: tz.TZDateTime.from(startDate, currentLocation),
        end: tz.TZDateTime.from(endDate, currentLocation),
        availability: availability,
      );
      // print(const JsonEncoder.withIndent(' ').convert(event.toJson()));
      final res = await _deviceCalendarPlugin.createOrUpdateEvent(event);
      print('isSuccess => ${res?.isSuccess}');
      Get.snackbar('Success!', 'Successfully added to calendar');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<Calendar?> getCalendarAccount() async {
    final calendars = await _deviceCalendarPlugin.retrieveCalendars();
    final calendar = await Get.bottomSheet<Calendar>(
      CupertinoActionSheet(
        title: const Text('Select Account Calendar'),
        actions: calendars.data
                ?.map(
                  (e) => CupertinoActionSheetAction(
                    onPressed: () {
                      Get.back<Calendar>(result: e);
                    },
                    child: Text(e.accountName ?? ''),
                  ),
                )
                .toList() ??
            [],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ),
    );
    return calendar;
  }

  Future<tz.Location> getTimezoneLocation() async {
    final timezone = await FlutterNativeTimezone.getLocalTimezone();
    final currentLocation = tz.getLocation(timezone);
    return currentLocation;
  }

  Future<Availability?> getAvailbility() async {
    final availability = await Get.bottomSheet<Availability>(
      CupertinoActionSheet(
        title: const Text('Select Availability'),
        actions: Availability.values
            .map(
              (e) => CupertinoActionSheetAction(
                onPressed: () {
                  Get.back<Availability>(result: e);
                },
                child: Text(e.enumToString),
              ),
            )
            .toList(),
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ),
    );
    return availability;
  }
}
