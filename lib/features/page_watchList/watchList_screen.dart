// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movies_app/config/watchList_provider.dart';
import 'package:provider/provider.dart';
import '../film_details_on_tap.dart';
import 'fav_film_item.dart';

class WatchListScreen extends StatefulWidget {
  static const String routeName = 'watchListScreen';

  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  late WatchlistProvider provider ;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<WatchlistProvider>(context);
    if(provider.filmList.isEmpty){
      provider.getAllFilmsFromFireStore();
    }
    return ListView.builder(
        itemCount: provider.filmList.length,
          itemBuilder: (context , index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FilmDetailsOnTap(
                title: provider.filmList[index].favTitle??'',
                backdropPath: provider.filmList[index].backdropPath??'',
                list: provider.filmList,
                genres: provider.filmList[index].genreIds??[],
                overview: provider.filmList[index].overview??'',
                popularity: provider.filmList[index].popularity??0,
                voteAverage: provider.filmList[index].voteAverage??0,
                posterPath: provider.filmList[index].favPoster??'',
                releaseDate: provider.filmList[index].favDate??'',
                index: index)));
          },
            child: FavFilmItem(favFilmItem: provider.filmList[index],));
      });
  }

}
