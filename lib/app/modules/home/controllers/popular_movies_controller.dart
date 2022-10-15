import 'package:get/get.dart';

import 'package:moviezone/app/network/fetch_popular_movies.dart';

class PopularMoviesCrontroller extends GetxController {

  var popularMovileList = [].obs;
  var isLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    popularMovies();
  }

  void popularMovies() async {
    isLoading(true);
    try {
      var popularMovie = await FetchPopularMovies().fetchPopularMovies();
      if (popularMovie != null) {
        popularMovileList.assignAll(popularMovie);
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
