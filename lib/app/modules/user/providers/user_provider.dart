import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  final fcm = FirebaseMessaging.instance;

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');

  Future<void> getFCMToken() async {
    final fcmToken = await fcm.getToken();
    print(fcmToken);
  }
}
