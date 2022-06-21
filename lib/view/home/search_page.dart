import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:movie_search/controller/movie/movie_controller.dart';
import 'package:movie_search/view/home/search_page_shimmer.dart';
import 'package:movie_search/view/widget/input_widget.dart';
import 'package:movie_search/view/widget/movie_cart_widget.dart';

import '../../theme/app_color.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final MovieController _movieController = Get.find<MovieController>();

  onClickSearch(String movieTitle) {
    FocusScope.of(context).unfocus();
    // Already validated from InputWidget
    _movieController.loadMovieListByTitle(movieTitle);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        child: Stack(
          children: [
            SizedBox(
              width: Get.width * 1,
              height: Get.height * 1,
            ),
            SingleChildScrollView(
              child: Container(
                width: Get.width * 1,
                padding: const EdgeInsets.only(top: 100),
                child: Obx(() => Column(
                  children: [
                    // Initial Message
                    if(_movieController.initialMessage.isNotEmpty)
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: Get.height * .035),
                          child: Image.asset(
                            'assets/images/movie_app_logo.png',
                            scale: 2.5,
                          ),
                        ),
                        Text(
                          _movieController.initialMessage.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: fontColorBlack,
                            fontFamily: 'Archivo',
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                    
                    // Loading Indicator
                    // if(_movieController.isLoading.value)
                    // SpinKitFadingCircle(color: fontColorBlack, size: Get.width * .1),

                    // Shimmer Indicator
                    if(_movieController.isLoading.value)
                    const SearchPageShimmer(),

                    // Movie List
                    Column(
                      children: _movieController.movieList.map((movie) {
                        return MovieCardWidget(movie);
                      }).toList(),
                    )
                  ],
                ))
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                width: Get.width * 1,
                height: 100,
                decoration: BoxDecoration(
                  color: backgroundColorWhite,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: borderColorLightGrey,
                    ),
                  ),
                ),
                child: InputWidget(
                  _movieController.inputSearchController,
                  "Search movies",
                  "Please enter movie title in search bar",
                  onClickSearch
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
