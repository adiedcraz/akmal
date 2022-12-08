import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Program {
  List<String>? coordinator;
  DateTime? endDate;
  String? location;
  DateTime? startDate;
  String? title;

  Program(
      {this.title,
      this.startDate,
      this.endDate,
      this.location,
      this.coordinator});

  Program.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    location = json['location'];
    coordinator = json['coordinator'].cast<String>();
  }

  Program.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = snapshot.data();
    title = json['title'];
    startDate = (json['start_date'] as Timestamp).toDate();
    endDate = (json['end_date'] as Timestamp).toDate();
    location = json['location'];
    coordinator =
        (json['coordinator'] as List).map((e) => e as String).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['location'] = location;
    data['coordinator'] = coordinator;
    return data;
  }

String get startDateFormatted => DateFormat('d MMM y').format(startDate!);
  String get endDateFormatted => DateFormat('d MMM y').format(endDate!);
  String get timeStart => DateFormat('jm').format(startDate!);
  String get timeEnd => DateFormat('jm').format(endDate!);
  String get dayWeekStart => DateFormat('EEE').format(startDate!);
  String get dayStart => DateFormat('dd').format(startDate!);

  String get date {
    if (isSameDay) return startDateFormatted;
    return '${DateFormat('d').format(startDate!)} hingga $endDateFormatted';
  }

  String get time {
    return '$timeStart - $timeEnd';
  }

  bool get isSameDay {
    final startDay = DateTime(
      startDate!.year,
      startDate!.month,
      startDate!.day,
    );
    final endDay = DateTime(
      endDate!.year,
      endDate!.month,
      endDate!.day,
    );
    return startDay.isAtSameMomentAs(endDay);
  }

  String get description => 'Bermula pada $date ($time) di $location';
}
  // String get startDateFormat => DateFormat('d MMM y').format(startDate!);
  // String get endDateFormat => DateFormat('d MMM y').format(endDate!);
  // String get startTimeFormat => DateFormat('jm').format(startDate!);

  // String get date {
  //   final startDay = DateTime(
  //     startDate!.year,
  //     startDate!.month,
  //     startDate!.day,
  //   );

  //   final endDay = DateTime(endDate!.year, endDate!.month, endDate!.day);
  //   final isSameDay = startDay.isAtSameMomentAs(endDay);
  //   if (isSameDay) return startDateFormat;
  //   return '${DateFormat('d').format(startDate!)} hingga $endDateFormat';
  // }

  // String get time {
  //   return startTimeFormat;
  // }

