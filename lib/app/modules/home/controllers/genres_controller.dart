import 'package:get/get.dart';
import 'package:moviezone/app/network/fetch_genres_list.dart';


class GenresController extends GetxController {

  var genresList = [].obs;
  var isLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    myGenres();
  }

  void myGenres() async {
    isLoading(true);
    try {
      var genresFromAPI = await FetchGenres().fetchGenres();
      if (genresFromAPI != null) {
        genresList.assignAll(genresFromAPI);
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
