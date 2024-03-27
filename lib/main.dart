import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'data/notifcation_service.dart';
import 'screens/screens.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

final getNotificationProvider = Provider((ref){
  LocalNotificationService.showSimpleNotification(
      title: 'Simple Notification',
      body: 'This is a simple notification',
      payload: 'This is sample date');
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
      // webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
      // androidProvider: AndroidProvider.debug,
      );
  await LocalNotificationService.init();
  runApp(ProviderScope(
    child: MyApp(
      appTheme: AppTheme(),
    ),
  ));
}

Future backgroundHandler(RemoteMessage msg) async {}

class MyApp extends ConsumerWidget {
  const MyApp({super.key, required this.appTheme});

  final AppTheme appTheme;

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(getNotificationProvider);

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => MaterialApp(
        navigatorKey: ref.read(navigatorKeyProvider),
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
