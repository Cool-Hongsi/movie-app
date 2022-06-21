// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:movie_search/controller/movie/landing_controller.dart';
import 'package:movie_search/theme/app_color.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  final LandingController _landingController = Get.find<LandingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: backgroundColorWhite,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/movie_app_logo.png',
          scale: 2.5,
        ),
        Container(
          margin: EdgeInsets.only(top: Get.height * .05),
          child: SpinKitCircle(color: featureColor, size: Get.width * .18),
        )        
      ],
    ));
  }
}
