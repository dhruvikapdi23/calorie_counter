import 'dart:developer';

import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

class StorageHelper {
  get storage => GetStorage();

  set isDarkMode(bool value) => storage.write("isDark", value);

  bool? get isDark => storage.read('isDark');

  dynamic get bibleVersion => storage.read(Session.bibleVersion);

  String? get language => storage.read(Session.language);

  removeData() async {
    await storage.remove('isLoggedIn');
    await Get.deleteAll(force: true);
  }

  set isLoggedIn(bool value) => storage.write("isLoggedIn", value);

  bool get isLoggedIn => storage.read('isLoggedIn') ?? false;

// set authData(AuthData data) => storage.write("authData", json.encode(data));

// AuthData get authData {
//   final parsed = json.decode(storage.read("authData") ?? "{}");
//   return AuthData.fromJson(parsed);
// }

  headerToken() {
    String token = storage.read(Session.user)['token'];
    log("token :$token");
    return {
      'Authorization': 'Bearer $token',
    };

  }

  headerWithoutToken() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
  }
}
