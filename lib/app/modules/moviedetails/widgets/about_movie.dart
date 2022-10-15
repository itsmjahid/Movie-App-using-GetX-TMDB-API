import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';
import 'package:moviezone/app/modules/moviedetails/widgets/about_movie_item.dart';

// ignore: must_be_immutable
class AboutMovie extends StatelessWidget {
  MoviedetailsController moviedetailsController =
      Get.put(MoviedetailsController());
  AboutMovie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Status:",
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
            Text(moviedetailsController.movieDetailsModel!.status!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ))
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        AboutMovieItem(
          itemName: 'Budget',
          itemValue: moviedetailsController.movieDetailsModel!.budget,
        ),
        const SizedBox(
          height: 8.0,
        ),
        AboutMovieItem(
          itemName: 'Revenue',
          itemValue: moviedetailsController.movieDetailsModel!.revenue,
        ),
      ],
    );
  }
}
