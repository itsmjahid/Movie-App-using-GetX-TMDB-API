import 'package:get/get.dart';
import 'package:moviezone/app/network/fetch_now_playing.dart';

class HomeController extends GetxController {

  var nowPlayingMovieList = [].obs;
  var isLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    nowPlayinng();
  }

  void nowPlayinng() async {
    isLoading(true);
    try {
      var nowPlayinngMovie = await FetchNowPlaying().fetchNowPlaying();
      if (nowPlayinngMovie != null) {
        nowPlayingMovieList.assignAll(nowPlayinngMovie);
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
