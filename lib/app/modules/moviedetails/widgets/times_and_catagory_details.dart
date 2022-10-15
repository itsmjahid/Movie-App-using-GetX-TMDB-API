import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:moviezone/app/modules/moviedetails/controllers/moviedetails_controller.dart';
// ignore: must_be_immutable
class TimesAndCatagory extends StatelessWidget {
 TimesAndCatagory({
    Key? key,
  }) : super(key: key);
 MoviedetailsController moviedetailsController = Get.put(MoviedetailsController());
  @override
  Widget build(BuildContext context) {
     String getDuration(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}min';
  }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.clock,
          color: Colors.black,
          size: 15,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          getDuration(moviedetailsController.movieDetailsModel!.runtime!),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 11.0,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Container(
            height: 40.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:moviedetailsController.movieDetailsModel!.genres!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Center(
                    child: Container(
                      height: 30,
                      width: 90,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(30.0)),
                          color: Colors.black.withOpacity(0.9)),
                      child: Center(
                        child: Text( moviedetailsController.movieDetailsModel!
                              .genres![index].name!,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: const TextStyle(
                              //height: 1.4,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
