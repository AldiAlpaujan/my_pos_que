import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pos_que/routes/app_pages.dart';
import 'package:my_pos_que/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      getPages: AppPages.routes,
      initialRoute: AppPages.initialRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
