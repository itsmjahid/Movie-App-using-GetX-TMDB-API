import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/app/modules/home/controllers/home_controller.dart';
import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';
import 'package:moviezone/app/modules/moviedetails/widgets/video_player.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NowPlayingSlider extends StatelessWidget {
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);
  HomeController homeController = Get.put(HomeController());
  MoviedetailsController moviedetailsController =
      Get.put(MoviedetailsController());
  NowPlayingSlider({Key? key}) : super(key: key);
  var movieID;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
          height: 220.0,
          child: PageIndicatorContainer(
            align: IndicatorAlign.bottom,
            length: homeController.nowPlayingMovieList.take(5).length,
            indicatorSpace: 8.0,
            padding: const EdgeInsets.all(5.0),
            indicatorColor: Color(0xFF5a606b),
            indicatorSelectorColor: Color(0xFFf4C10F),
            shape: IndicatorShape.roundRectangleShape(
                size: Size(15.0, 5.0), cornerSize: Size.square(1)),
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: homeController.nowPlayingMovieList.take(5).length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: homeController.nowPlayingMovieList[index].id,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                    "https://image.tmdb.org/t/p/original/" +
                                        homeController
                                            .nowPlayingMovieList[index]
                                            .backdropPath)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [
                                0.0,
                                0.9
                              ],
                              colors: [
                                Color(0xFF151C26).withOpacity(1.0),
                                Color(0xFF151C26).withOpacity(0.0)
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: IconButton(
                          onPressed: () async {
                            movieID = await homeController
                                .nowPlayingMovieList[index].id;
                            moviedetailsController.movieDetails(movieID);
                            await Get.to(() => VideoPlayer());
                          },
                          icon: Icon(
                            Icons.play_circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 40.0,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 30.0,
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            width: 250.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  homeController
                                      .nowPlayingMovieList[index].title,
                                  style: TextStyle(
                                      height: 1.5,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              },
            ),
          ));
    });
  }
}
