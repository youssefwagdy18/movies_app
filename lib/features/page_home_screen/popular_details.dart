import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/my_theme/my_theme.dart';

import '../../api_response/top_section_api/TopSectionResponse.dart';


class TopSectionDetails extends StatefulWidget {
  final Result videoPath;
  const TopSectionDetails({super.key, required this.videoPath});

  @override
  State<TopSectionDetails> createState() => _TopSectionDetailsState();
}

class _TopSectionDetailsState extends State<TopSectionDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://image.tmdb.org/t/p/w500${widget.videoPath.backdropPath}',
          fit: BoxFit.cover,
        ),
        // SizedBox(height: MediaQuery.of(context).size.height*0.05,),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: MediaQuery.of(context).size.height * 0.32,
                width: MediaQuery.of(context).size.width * 0.32,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${widget.videoPath.posterPath}'
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.24,
                  // width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.05,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.videoPath.title ?? '',
                            style: MyTheme.darkMode.textTheme.titleSmall!.copyWith(
                              fontWeight:FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.01,
                      // ),
                      Text(
                        widget.videoPath.releaseDate ?? '',
                        style: MyTheme.darkMode.textTheme.titleSmall?.copyWith(
                          color: MyTheme.lightGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
