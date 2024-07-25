import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/film_details_on_tap.dart';
import 'package:movies_app/my_theme/my_theme.dart';

import '../../api_response/search_page_api/SearchResponse.dart';

class SearchItem extends StatefulWidget{
  final List<Result>searchedFilms;
  final int index;
   const SearchItem({super.key, required this.searchedFilms,required this.index});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
        FilmDetailsOnTap(
            title: widget.searchedFilms[widget.index].title??'',
            backdropPath: widget.searchedFilms[widget.index].backdropPath??'',
            list: widget.searchedFilms,
            genres: widget.searchedFilms[widget.index].genreIds??[],
            overview: widget.searchedFilms[widget.index].overview??'',
            popularity: widget.searchedFilms[widget.index].popularity??0,
            voteAverage: widget.searchedFilms[widget.index].voteAverage??0,
            posterPath: widget.searchedFilms[widget.index].posterPath??'',
            releaseDate: widget.searchedFilms[widget.index].releaseDate??'',
            index: widget.index)));
      },
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: MyTheme.primaryGreyColor),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w500${widget.searchedFilms[widget.index].posterPath??''}')),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Movie Name :',
                            style: MyTheme.darkMode.textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 70,
                            child: Text(
                              widget.searchedFilms[widget.index].title ?? '',
                              style: MyTheme.darkMode.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w400),
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Release Date :  ${widget.searchedFilms[widget.index].releaseDate ?? ''}',
                      style: MyTheme.darkMode.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}