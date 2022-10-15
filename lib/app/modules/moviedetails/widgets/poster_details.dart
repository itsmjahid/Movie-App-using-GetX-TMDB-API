import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/app/modules/moviedetails/widgets/video_player.dart';

import 'package:get/get.dart';
import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';

// ignore: must_be_immutable
class PosterDetails extends StatelessWidget {
  MoviedetailsController moviedetailsController =
      Get.put(MoviedetailsController());
  PosterDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          AspectRatio(
              aspectRatio: 3 / 2,
              child:
                  moviedetailsController.movieDetailsModel!.backdropPath == null
                      ? Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/no_photo.jpg"))
                      : Image(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/original/" +
                                  moviedetailsController
                                      .movieDetailsModel!.backdropPath
                                      .toString())
                        )),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(1.0)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 1],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0.0,
              left: 10.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0)),
                          height: 120.0,
                          child: AspectRatio(
                              aspectRatio: 2 / 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: moviedetailsController
                                            .movieDetailsModel!.posterPath ==
                                        null
                                    ? Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/no_photo.jpg"),
                                      )
                                    : Image(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/original/" +
                                                moviedetailsController
                                                    .movieDetailsModel!
                                                    .posterPath
                                                    .toString())
                                      ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            moviedetailsController.movieDetailsModel!.title!,
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Release date: " +
                                    moviedetailsController
                                        .movieDetailsModel!.releaseDate!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 0.0,
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: IconButton(
              onPressed: () {
                Get.to(() => VideoPlayer());
              },
              icon: Icon(
                Icons.play_circle,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 40.0,
              ),
            ),
          ),
          Positioned(
            left: 5.0,
            child: SafeArea(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25.0,
                    ))),
          ),
        ],
      ),
    );
  }
}
