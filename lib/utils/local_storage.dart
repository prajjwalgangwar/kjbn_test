import 'dart:convert';

import 'package:kjbn_test_dummy/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _keyHomeModel = 'homeModel';

  // Save HomeModel to SharedPreferences
  Future<bool> saveHomeModel(HomeModel homeModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> homeModelJson = homeModel.toJson();
    return await prefs
        .setString(_keyHomeModel, jsonEncode(homeModelJson))
        .then((value) => value);
  }

  // Fetch HomeModel from SharedPreferences
  Future<HomeModel?> getHomeModel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? homeModelString = prefs.getString(_keyHomeModel);
    if (homeModelString != null) {
      final Map<String, dynamic> homeModelJson = jsonDecode(homeModelString);
      return HomeModel.fromJson(homeModelJson);
    }
    return const HomeModel();
  }

  // Delete HomeModel from SharedPreferences
  Future<void> deleteHomeModel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyHomeModel);
  }
}
