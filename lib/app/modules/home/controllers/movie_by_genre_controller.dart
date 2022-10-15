import 'package:get/get.dart';

import 'package:moviezone/app/network/fetch_movie_by_genre.dart';


class MovieByGenreController extends GetxController {

  var movieByGenreList = [].obs;
  var isLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    movieByGenre(28);
  }

  void movieByGenre(int genreId) async {
    isLoading(true);
    try {
      var movieByGenreId = await FetchMovieByGenre().fetchmovieByGenre(genreId);
      if (movieByGenreId != null) {
        movieByGenreList.assignAll(movieByGenreId);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
