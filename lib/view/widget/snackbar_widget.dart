// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_search/theme/app_color.dart';

Future<void> SnackbarWidget(String errorMessage) async {
  Get.snackbar('title', 'message',
    titleText: Text(
      'Warning',
      style: TextStyle(
        color: fontColorWhite,
        fontSize: 16,
        fontFamily: 'Archivo',
        fontWeight: FontWeight.w500
      ),
    ),
    messageText: Text(errorMessage,
      style: TextStyle(
        color: fontColorWhite,
        fontSize: 15,
        fontFamily: 'Archivo',
        fontWeight: FontWeight.w500
      )
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColorBlack,
    margin: const EdgeInsets.all(6),
    duration: const Duration(milliseconds: 2500)
  );
}
