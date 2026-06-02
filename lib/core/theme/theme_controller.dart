import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final _key = 'isDarkMode';
  final RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _loadThemeFromPrefs();
  }

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromPrefs() {
    final prefs = Get.find<SharedPreferences>();
    return prefs.getBool(_key) ?? false;
  }

  void _saveThemeToPrefs(bool isDark) {
    final prefs = Get.find<SharedPreferences>();
    prefs.setBool(_key, isDark);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToPrefs(isDarkMode.value);
  }
}
