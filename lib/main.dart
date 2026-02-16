import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_eyezon_app/core/routes/app_router.dart';

void main() {
  runApp(const EyeZonApp());
}

class EyeZonApp extends StatelessWidget {
  const EyeZonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      locale: const Locale('ar', ''), // إجبار التطبيق على العربية
      supportedLocales: const [
        Locale('ar', ''), // اللغة العربية
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
