import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/program_model.dart';

class ProgramProvider extends GetConnect {
  final db = FirebaseFirestore.instance;
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Program.fromJson(map);
      if (map is List)
        return map.map((item) => Program.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Program?> getProgram(int id) async {
    final response = await get('program/$id');
    return response.body;
  }

  Stream<List<Program>> getPrograms() {
    return db.collection("program").snapshots().map(
          (res) => res.docs
              .map(
                (e) => Program.fromFirestore(e),
              )
              .toList(),
        );
  }

  Future<Response<Program>> postProgram(Program program) async =>
      await post('program', program);
  Future<Response> deleteProgram(int id) async => await delete('program/$id');
}
