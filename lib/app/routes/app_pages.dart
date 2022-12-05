import 'package:get/get.dart';

import 'package:akmal/app/modules/home/bindings/home_binding.dart';
import 'package:akmal/app/modules/home/views/home_view.dart';
import 'package:akmal/app/modules/program/bindings/program_binding.dart';
import 'package:akmal/app/modules/program/views/program_view.dart';
import 'package:akmal/app/modules/program_detail/bindings/program_detail_binding.dart';
import 'package:akmal/app/modules/program_detail/views/program_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAM,
      page: () => ProgramView(),
      binding: ProgramBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAM_DETAIL,
      page: () => ProgramDetailView(),
      binding: ProgramDetailBinding(),
    ),
  ];
}
