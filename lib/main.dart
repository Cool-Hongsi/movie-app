import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movie_search/data/repository/landing_repository.dart';
import 'package:movie_search/data/repository/movie_repository.dart';
import 'package:movie_search/route/route_page.dart';

import 'const/route_const.dart';

void main() async {
  /* ********** Initial Configuration ********** */
  await dotenv.load(fileName: '.env'); // Load env file
  // await GetStorage.init(); // Alternative of shared preference

  // Inject repositories in advance (Repository serve as bridge between controller and api calling)
  // Get.lazyPut => Inject instance in application with lazy.
  // In other words, can utilize instance by using Get.find() after Get.put() as long as it is injected in application
  Get.lazyPut<LandingRepository>(() => LandingRepository());
  Get.lazyPut<MovieRepository>(() => MovieRepository());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: RouteConst.LANDING,
    defaultTransition: Transition.fade,
    getPages: RoutePage.pages,
    // theme: lightTheme,
    // darkTheme: lightTheme,
    // locale: const Locale('en', 'US'),
  ));
}
