import 'package:FMS/view/profile/profile.dart';
import 'package:FMS/view/task/task.dart';
import 'package:get/get.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view/home/home.dart';
import 'package:FMS/view/login/login_view.dart';
import 'package:FMS/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => SplashScreen(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.zoom),
        GetPage(
            name: RouteName.loginScreen,
            page: () => LoginView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.zoom),
        GetPage(
          name: RouteName.homeScreen,
          page: () => Home(),
          transitionDuration: const Duration(milliseconds: 0),
          transition: Transition.zoom
        ),
        GetPage(
          name: RouteName.taskScreen,
          page: () => Task(),
          transitionDuration: const Duration(milliseconds: 0),
          transition: Transition.zoom
        ),
        GetPage(
          name: RouteName.profileScreen,
          page: () => Profile(),
          transitionDuration: const Duration(milliseconds: 0),
          transition: Transition.zoom
        ),
      ];
}
