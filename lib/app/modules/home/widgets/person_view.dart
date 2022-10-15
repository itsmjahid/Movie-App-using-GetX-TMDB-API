import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PersonView extends StatelessWidget {
  MoviedetailsController moviedetailsController =
      Get.put(MoviedetailsController());
  PersonView({required this.imageFrom,required this.itemCount,required this.nameFrom});
final int? itemCount;
final dynamic imageFrom;
final dynamic nameFrom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Card (
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: SizedBox(
                height: 110.0,
                child: Stack(children: [
                  AspectRatio(
                    aspectRatio: 2 / 2,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: imageFrom[index].profilePath == null
                            ? Image(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/no_photo.jpg"))
                            : Image(
                                fit: BoxFit.cover,
                                image:CachedNetworkImageProvider( "https://image.tmdb.org/t/p/w300/" +
                                       imageFrom[index]
                                            .profilePath
                                            .toString()))),
                  ),
                  AspectRatio(
                    aspectRatio: 2 / 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.5)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 1],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 3.0,
                      left: 3.0,
                      right: 3.0,
                      child: SizedBox(
                        width: 80.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameFrom[index].name,
                              style: const TextStyle(
                                  fontSize: 13.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                            nameFrom ==
                                    moviedetailsController
                                        .movieDetailsModel?.castList
                                ? Text(
                                    moviedetailsController.movieDetailsModel!
                                        .castList![index].character!,
                                    style: const TextStyle(
                                        fontSize: 10.0,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.w500),
                                  )
                                : Container(),
                          ],
                        ),
                      ))
                ]),
              ),
            );
          }),
    );
  }
}
