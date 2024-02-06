import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/providers/dashboard_provider.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    // webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // androidProvider: AndroidProvider.debug,
  );
  // await Provider.of<DashBoardProvider>(context, listen: false).retrieveRecords();
  runApp(ProviderScope(
    child: MyApp(
      appTheme: AppTheme(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appTheme});

  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder:(context, child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme.light,
        themeMode: ThemeMode.system,
        initialRoute: '/splashscreen',
        routes: {
          '/login': (context) => SignIn(),
          '/splashscreen': (context) => const SplashScreen(),
          '/phone': (context) => const PhoneRegistration(),
          '/home': (context) => const Home(),
          '/emailverification': (context) => EmailVerification(),
        },
      ),
    );
  }
}
