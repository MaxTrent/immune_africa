import 'package:flutter/material.dart';
import 'package:immune_africa/themes/appThemes.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp(
    appTheme: AppTheme(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appTheme});

  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: appTheme.light,
      themeMode: ThemeMode.system,
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => const SplashScreen(),
      },
    );
  }
}
