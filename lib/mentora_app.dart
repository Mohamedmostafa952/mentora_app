import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentora_app/config/theme_manager/theme_manager.dart';
import 'package:mentora_app/core/routes_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MentoraApp extends StatelessWidget {
  const MentoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      builder: (_,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates:AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        locale: Locale("en"),
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.mainLayout,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
