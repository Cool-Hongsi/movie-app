import 'package:get/get.dart';
import 'package:movie_search/controller/movie/movie_controller.dart';
import 'package:movie_search/data/repository/movie_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() => MovieController(movieRepo: Get.find<MovieRepository>()));
    // Put more controller (Favorite, Profile ...)
  }
}
