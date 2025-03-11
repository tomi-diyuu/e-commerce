import 'dart:convert';

import 'package:e_commerce/src/network/model/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _keys {
  static const String user = 'user';
}

class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  static UserPrefs get I => instance;

  late SharedPreferences _prefs;

  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setUser(MUser? value) {
    if (value == null) {
      _prefs.remove(_keys.user);
    } else {
      _prefs.setString(_keys.user, jsonEncode(value.toJson()));
    }
  }

  MUser? getUser() {
    final value = _prefs.getString(_keys.user);

    try {
      if ((value ?? '').isEmpty) {
        return null;
      } else {
        final map = jsonDecode(value!);
        if (map['id'] == null) {
          return null;
        } else {
          return MUser.fromJson(map);
        }
      }
    } catch (e) {
      return null;
    }
  }
}
