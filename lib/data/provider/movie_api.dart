import 'package:get/get_connect/connect.dart';
import '../../const/api_const.dart';
import 'global_api.dart';

class MovieAPIClient extends GetConnect {
  static loadMovieListByTitleRepo(String movieTitle) async {
    return await GlobalAPIClient.getRequest(
      '${APIConst.API_ADDRESS}/?${APIConst.SEARCH_BY_TITLE}=$movieTitle&apikey=${APIConst.API_KEY}'
    );
  }
}
