import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/providers/dashboard_provider.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'data/notifcations.dart';
import 'screens/screens.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    // webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // androidProvider: AndroidProvider.debug,
  );
  runApp(ProviderScope(
    child: MyApp(
      appTheme: AppTheme(),
    ),
  ));
}


Future backgroundHandler(RemoteMessage msg) async {}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.appTheme});

  final AppTheme appTheme;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
    LocalNotificationService.initialize();
    FirebaseMessaging.instance.getInitialMessage().then((message) {

    });

    // To initialise when app is not terminated
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        LocalNotificationService.display(message);
      }
    });

    // To handle when app is open in
    // user divide and heshe is using it
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("on message opened app");
    });
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder:(context, child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: widget.appTheme.light,
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
