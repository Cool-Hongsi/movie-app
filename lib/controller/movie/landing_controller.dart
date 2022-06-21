import 'package:get/get.dart';
import 'package:movie_search/controller/global/global_controller.dart';
import 'package:movie_search/data/repository/landing_repository.dart';

class LandingController extends GetxController {
  final LandingRepository landingRepo;
  LandingController({required this.landingRepo});

  final GlobalController _globalController = Get.put(GlobalController());

  @override
  void onInit() async {
    // Call necessary API while rendering landing UI with 'landingRepo'
    // Such as initial necessary data or check login status ...
    await Future.delayed(const Duration(milliseconds: 2500));

    // Once it is done, go home page
    _globalController.goToHomePage();
    super.onInit();
  }
}
