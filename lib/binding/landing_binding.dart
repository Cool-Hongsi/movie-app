import 'package:get/get.dart';
import 'package:movie_search/controller/movie/landing_controller.dart';
import 'package:movie_search/data/repository/landing_repository.dart';

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() => LandingController(landingRepo: Get.find<LandingRepository>()));
  }
}
