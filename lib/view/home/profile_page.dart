import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_search/theme/app_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 1,
      height: Get.height * 1,
      child: Center(
        child: Text(
          'Profile Page',
          style: TextStyle(
            color: fontColorBlack,
            fontSize: Get.width * .045,
            fontFamily: 'Archivo'
          ),
        ),
      ),
    );
  }
}
