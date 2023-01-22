import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {
  static late SharedPreferences prefs;

  static Future<SharedPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static saveObject(String key, Map<String, dynamic> data) {
    prefs.setString(key, jsonEncode(data));
  }

  static Map<String, dynamic> getObject(String key) {
    var data = prefs.getString(key);
    return jsonDecode(data!);
  }
}
