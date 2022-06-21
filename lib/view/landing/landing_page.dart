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
        Center(
          child: Image.asset(
            'assets/images/movie_app_logo.png',
            scale: 2.5,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: Get.height * .05),
          child: Text('Welcome to Movie App',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w400,
              fontSize: Get.width * .065,
              height: 1.4
            )
          )
        ),
        SpinKitWave(color: backgroundColorBlack, size: Get.width * .1),
      ],
    ));
  }
}
