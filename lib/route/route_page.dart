import 'package:get/get.dart';
import 'package:movie_search/binding/home_binding.dart';
import 'package:movie_search/view/home/home_page.dart';
import '../binding/landing_binding.dart';
import '../const/route_const.dart';
import '../view/landing/landing_page.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteConst.LANDING,
      page: () => LandingPage(),
      binding: LandingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteConst.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
