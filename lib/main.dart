import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'theme_controller.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  await GetStorage.init(); 
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeController().lightTheme,
      darkTheme: ThemeController().darkTheme,
      themeMode: ThemeController.themeMode.value, // Set initial theme mode
      home: HomePage(),
    );
  }
}
