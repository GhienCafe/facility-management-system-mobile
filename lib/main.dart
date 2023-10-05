import 'package:FMS/res/getx_localization/language.dart';
import 'package:FMS/view_models/controller/notification/notification_controller.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:FMS/res/routes/routes.dart';
import 'package:FMS/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  // Initialize cho Local Notification
  await NotificationController.initializeLocalNotifications(debug: true);
  print(AwesomeNotificationsFcm().requestFirebaseAppToken());
  // Initialize cho Push Notification
  await NotificationController.initializeRemoteNotifications(debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // we create this AppRoutes class where we define the page route
      getPages: AppRoutes.appRoutes(),
    );
  }
}
