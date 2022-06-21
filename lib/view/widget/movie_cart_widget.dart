// ignore_for_file: non_constant_identifier_names, avoid_print
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:movie_search/model/movie_model.dart';

import '../../theme/app_color.dart';

Widget MovieCardWidget(MovieModel movie) {
  return Container(
    margin: EdgeInsets.only(bottom: Get.height * .025),
    child: Card(
      elevation: 3,
      child: Row(
        children: [
          SizedBox(
            width: 140,
            height: 200,
            child: ExtendedImage.network(
              movie.poster.toString(),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              cache: true,
              loadStateChanged: (ExtendedImageState state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: borderColorDarkGrey),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: SpinKitFadingCircle(color: fontColorBlack, size: Get.width * .08)
                    );
                    case LoadState.completed:
                      return null;
                    case LoadState.failed:
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            state.reLoadImage();
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: backgroundColorBlack,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Fail to load',
                              style: TextStyle(
                                fontFamily: 'Archivo',
                                color: fontColorWhite,
                                fontSize: 15
                              ),
                            ),
                          )
                        ),
                      );
                    }
                  }
                ),
          ),
          Container(
            width: Get.width * 1 - Get.width * .1 - 140 - 8, // Whole width - Padding - Image - Card padding & Border
            height: 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    movie.year.toString(),
                    style: TextStyle(
                      fontFamily: 'Questrial',
                      color: fontColorGrey,
                    ),
                  ),
                  Divider(
                    height: 20,
                    color: borderColorDarkGrey,
                  ),
                  Text(
                    movie.title.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      color: fontColorBlack,
                      fontSize: 14
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Click ${movie.title}");
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: Get.width * .03, vertical: Get.height * .016),
                      decoration: BoxDecoration(
                        color: featureColor,
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      width: double.infinity,
                      child: Text(
                        'Add To List',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: 15,
                          color: fontColorWhite
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]
      )
    ),
  );
}
