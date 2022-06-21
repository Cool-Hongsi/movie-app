import 'package:movie_search/data/provider/movie_api.dart';

class MovieRepository {
  static MovieRepository instance = MovieRepository();

  Future loadMovieListByTitleRepo(String movieTitle) async {
    return await MovieAPIClient.loadMovieListByTitleRepo(movieTitle);
  }
}
