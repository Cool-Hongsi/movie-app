// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_search/data/repository/movie_repository.dart';
import 'package:movie_search/model/movie_model.dart';
import 'package:movie_search/view/widget/snackbar_widget.dart';

class MovieController extends GetxController {
  final MovieRepository movieRepo;
  MovieController({required this.movieRepo});

  TextEditingController inputSearchController = TextEditingController(text: "");

  Rx<bool> isLoading = false.obs;
  RxList<MovieModel> movieList = <MovieModel>[].obs;
  Rx<String> initialMessage = "Let's search movies!".obs;

  @override
  void onInit() async {
    print("onInit MovieController!");
    super.onInit();
  }

  showLoading() {
    isLoading.value = true;
  }

  closeLoading() {
    isLoading.value = false;
  }

  loadMovieListByTitle(String movieTitle) async {
    // Only executed once
    if(initialMessage.isNotEmpty) {
      initialMessage.value = "";
    }

    // Updates to the search term should update the result list => Initialize
    movieList.value = [];

    showLoading();
    await Future.delayed(const Duration(milliseconds: 1500));

    var loadMovieListByTitleResponse;

    try {
      loadMovieListByTitleResponse = await movieRepo.loadMovieListByTitleRepo(movieTitle);
    } catch (err) {
      SnackbarWidget(err.toString());
    }

    // Success (Response value is not boolean type ("True" or "False"))
    if (loadMovieListByTitleResponse['Response'] == "True") {
      loadMovieListByTitleResponse['Search'].forEach((movie) => {
        movieList.add(MovieModel.fromJSON(movie)) // Create Movie Model Objects
      });
    }
    // Fail
    else {
      SnackbarWidget(loadMovieListByTitleResponse['Error']);
    }

    closeLoading();
    
    /*
      [Sample Response]
      {
        "Search": [
          {
            "Title": "Harry Potter and the Deathly Hallows: Part 2",
            "Year": "2011",
            "imdbID": "tt1201607",
            "Type": "movie",
            "Poster": "https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg"
          },
          .....
        ],
        "totalResults": "816",
        "Response": "True"
      }
    */
  }
}
