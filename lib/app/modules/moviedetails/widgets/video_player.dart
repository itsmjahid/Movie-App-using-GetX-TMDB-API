import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class VideoPlayer extends StatelessWidget {
  MoviedetailsController moviedetailsController =
      Get.put(MoviedetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (moviedetailsController.isLoading.value) {
          return Center(child: CupertinoActivityIndicator());
        }
        return Center(
          child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: moviedetailsController
                      .movieDetailsModel!.trailerId!, //Add videoID.
                  flags: YoutubePlayerFlags(
                    hideControls: false,
                    controlsVisibleAtStart: true,
                    autoPlay: false,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) {
                return Container(
                  child: player,
                );
              }),
        );
      }),
    );
  }
}
