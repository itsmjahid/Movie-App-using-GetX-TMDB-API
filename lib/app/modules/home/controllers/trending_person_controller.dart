import 'package:get/get.dart';


import 'package:moviezone/app/network/fetch_trending_person.dart';

class TrendingPersonController extends GetxController {

  var trendingPersonList = [].obs;
  var isLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    trendingPersons();
  }

  void trendingPersons() async {
    isLoading(true);
    try {
      var trendingPerson = await FetchTrendingPerson().fetchTrendingPerson();
      if (trendingPerson != null) {
        trendingPersonList.assignAll(trendingPerson);
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
