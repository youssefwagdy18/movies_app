import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_response/browse_page_api/GenreIdResponse.dart';
import '../api_response/browse_page_api/genreApiManager.dart';
import '../my_theme/my_theme.dart';

class FilmDetailsOnTap extends StatefulWidget {
  final String title ;
  final String backdropPath;
  final String releaseDate;
  final String posterPath;
  final String overview;
  final List<int> genres;
  final double voteAverage;
  final double popularity;
  final List<dynamic> list;
  final int index;

  const FilmDetailsOnTap({super.key,required this.title,required this.backdropPath ,required this.list,
  required this.genres,required this.overview,required this.popularity,required this.voteAverage,
  required this.posterPath , required this.releaseDate,required this.index});

  @override
  State<FilmDetailsOnTap> createState() => _FilmDetailsOnTapState();
}

class _FilmDetailsOnTapState extends State<FilmDetailsOnTap> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GenreApiManager.getData();
    List<Genres>? genres;
    // genres =GenreApiManager.getData().s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryGreyColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.title ?? '',
          style: MyTheme.darkMode.textTheme.titleLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: CachedNetworkImage(
              imageUrl:
              'https://image.tmdb.org/t/p/original${widget.backdropPath}',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title ?? '',
              style: MyTheme.darkMode.textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.releaseDate ?? '',
              style: MyTheme.darkMode.textTheme.titleSmall!
                  .copyWith(color: MyTheme.lightGreyColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              width: double.infinity,
              child: Row(
                children: [
                  ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl:
                      'https://image.tmdb.org/t/p/original${widget.posterPath}',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Container(
                      //   padding: const EdgeInsets.all(15),
                      //   margin: const EdgeInsets.all(10),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(15),
                      //       border: Border.all(
                      //         color: Colors.white,
                      //       )),
                      //   child:
                      //       widget.list[widget.index].contains(widget.genres)?
                      //   Text(
                      //     genres?[widget.index].name??''
                      //     ,
                      //     style: MyTheme.darkMode.textTheme.titleSmall,
                      //   ):
                      //   Text(" "),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Rating  :  ",
                              style: MyTheme.darkMode.textTheme.titleSmall,),
                            const Icon(Icons.star,color: MyTheme.selectedTabColor,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.03,
                            ),
                            Text(widget.voteAverage.toString(),
                              style: MyTheme.darkMode.textTheme.titleSmall,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Popularity  :  ",
                              style: MyTheme.darkMode.textTheme.titleSmall,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.03,
                            ),
                            Text(widget.popularity.toString(),
                              style: MyTheme.darkMode.textTheme.titleSmall,),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Overview : ",
                  style: MyTheme.darkMode.textTheme.titleSmall,),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.overview??'',
                    style: MyTheme.darkMode.textTheme.titleSmall,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
