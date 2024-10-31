import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static Rx<ThemeMode> themeMode = ThemeMode.system.obs; // Theme mode state
  final storage = GetStorage(); // For storing theme state

  // Define the light theme
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(color: Color(0xFFCFCDAE)),
    scaffoldBackgroundColor: const Color(0xFFCFCDAE),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6750A4), // Button color for light theme
        foregroundColor: Color.fromARGB(255, 255, 255, 255), // Text color for light theme
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );

  // Define the dark theme
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 36, 36, 36)),
    scaffoldBackgroundColor: const Color.fromARGB(255, 36, 36, 36),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Button color for dark theme
        foregroundColor: const Color(0xFF6750A4), // Text color for dark theme
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );

  @override
  void onInit() {
    super.onInit();
    // Retrieve the stored theme mode when the app starts
    String storedTheme = storage.read('themeMode') ?? 'system';
    setThemeMode(_getThemeModeFromString(storedTheme), save: false);
  }

  // Toggle between light and dark modes
  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      setThemeMode(ThemeMode.dark);
    } else {
      setThemeMode(ThemeMode.light);
    }
  }

  // Set the theme mode and optionally save the state
  void setThemeMode(ThemeMode mode, {bool save = true}) {
    themeMode.value = mode;
    // Use a post-frame callback to avoid calling setState during build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.changeThemeMode(mode);
    });
    if (save) {
      storage.write('themeMode', _getStringFromThemeMode(mode)); // Save theme mode
    }
  }

  // Convert ThemeMode to string for storage
  String _getStringFromThemeMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
      default:
        return 'system';
    }
  }

  // Convert stored string back to ThemeMode
  ThemeMode _getThemeModeFromString(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
}
