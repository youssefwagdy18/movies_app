import 'package:flutter/material.dart';
import 'package:movies_app/api_response/browse_page_api/GenreIdResponse.dart';
import '../api_response/browse_page_api/FilmsGenresResponse.dart';

class BrowseProvider extends ChangeNotifier {
  List<int>? index;
  Genres? genreId;
  // List<Results>? unSortedFilms;
  // List<Results>? sortedFilms;
  int? filmsIndex;


  List<int>? pageNumbersList;
  int pageNumber=1;

  addingGenreId(Genres id) {
    genreId = id;
  }

  // sorting(List<Results>? unSortedFilms) {
  //   for (int i = 0; i < unSortedFilms!.length; i++) {
  //     if (unSortedFilms[index![i]].genreIds!.contains(genreId)) {
  //       sortedFilms?.add(unSortedFilms[index![i]]);
  //     }
  //     // print(sortedFilms?.first.id);
  //   }
  // }



  @override
  notifyListeners();
}
