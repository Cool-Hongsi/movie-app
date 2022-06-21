/*
  This global controller may include data or function that can be shared globally.
*/

import 'package:get/get.dart';
import 'package:movie_search/const/route_const.dart';

class GlobalController extends GetxController {
  goToHomePage() {
    Get.toNamed(RouteConst.HOME);
  }

  // Other global functions
}
