import 'package:get/get.dart';
import 'package:mvvm/res/routes/routes_name.dart';
import 'package:mvvm/view/home/home.dart';
import 'package:mvvm/view/login/login_view.dart';
import 'package:mvvm/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => SplashScreen(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.loginScreen,
            page: () => LoginView(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.homeScreen,
            page: () => Home(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRight),
      ];
}
