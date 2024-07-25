import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_response/browse_page_api/FilmsGenresResponse.dart';
import 'package:movies_app/config/browse_provider.dart';
import 'package:movies_app/my_theme/my_theme.dart';
import 'package:provider/provider.dart';

class FilmOfCategoryDetails extends StatelessWidget {
  static const String routeName = 'FilmOfCategory';
  const FilmOfCategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BrowseProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as Results;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryGreyColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          args.title ?? '',
          style: MyTheme.darkMode.textTheme.titleLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: CachedNetworkImage(
              imageUrl:
                  'https://image.tmdb.org/t/p/original${args.backdropPath}',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              args.title ?? '',
              style: MyTheme.darkMode.textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              args.releaseDate ?? '',
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
                          'https://image.tmdb.org/t/p/original${args.posterPath}',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: Text(
                          provider.genreId!.name ?? '',
                          style: MyTheme.darkMode.textTheme.titleSmall,
                        ),
                      ),
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
                            Text(args.voteAverage.toString(),
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
                            Text(args.popularity.toString(),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Overview : ",
                  style: MyTheme.darkMode.textTheme.titleSmall,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(args.overview??'',
                  style: MyTheme.darkMode.textTheme.titleSmall,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
