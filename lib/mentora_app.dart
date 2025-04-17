import 'package:flutter/material.dart';
import 'package:mentora_app/config/theme_manager/theme_manager.dart';
import 'package:mentora_app/core/routes_manager.dart';

class MentoraApp extends StatelessWidget {
  const MentoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.login,
      theme: ThemeManager.themeData,
    );
  }
}
