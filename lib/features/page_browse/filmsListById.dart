import 'package:flutter/material.dart';
import 'package:movies_app/api_response/browse_page_api/FilmsGenresResponse.dart';
import 'package:movies_app/api_response/browse_page_api/filmsGenresApiManager.dart';
import 'package:movies_app/config/browse_provider.dart';
import 'package:movies_app/features/page_browse/film_of_category_details.dart';
import 'package:movies_app/features/page_browse/films_of_category.dart';
import 'package:provider/provider.dart';
import '../../my_theme/my_theme.dart';

class FilmsListByI extends StatefulWidget {
  static const String routeName = 'film_list_by_id';
  const FilmsListByI({super.key});

  @override
  State<FilmsListByI> createState() => _FilmsListByIdState();
}

class _FilmsListByIdState extends State<FilmsListByI> {
  // List<Results> totalFilms = List.generate(20, (index) => Results());
  List<Results> totalFilms = [];
  double scrollThreshold =50.0;
  List<Results> filteredItems = [];
  List<int> indexFilm = [];
  int pageNumber = 1;
  // bool isLoading = false;
  bool isEnd=false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        print(scrollController.position.pixels);
          setState(() {
            _fetchMovies();
          });
        // loadMoreItems();
      }
    }); // print(scrollController.position.pixels);
  }
  Future<void> _fetchMovies() async {
    setState(() {
      isEnd = true;
    });

    try {
      FilmsGenresApiManager.getData(++pageNumber)
          .then((newList) => totalFilms.addAll(newList?.results ?? []));
      setState(() {
        isEnd = false;
      });
    } catch (e) {
      // Handle error
      setState(() {
        isEnd = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(totalFilms);
    // if (isEnd==true) {
    //   FilmsGenresApiManager.getData(++pageNumber)
    //       .then((newList) => totalFilms.addAll(newList?.results ?? []));
    //
    //   isEnd = false;
    // }
    BrowseProvider provider = Provider.of(context);
    print(indexFilm);
    return FutureBuilder<FilmsGenresResponse?>(
      future: FilmsGenresApiManager.getData(pageNumber),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Something has error'),
              ElevatedButton(
                  onPressed: () {
                    FilmsGenresApiManager.getData(pageNumber);
                  },
                  child: const Text('Try again'))
            ],
          );
        }
        else if (snapshot.hasData) {
          var filmList = snapshot.data!.results ?? [];
          if (totalFilms.isEmpty) {
            totalFilms = filmList;
          }

          // totalFilms = filmList;
          return ListView.builder(
            controller: scrollController,
            itemCount: totalFilms.length,
            itemBuilder: (context, index) {
              if (totalFilms[index].genreIds!.contains(provider.genreId!.id)) {
                filteredItems = totalFilms;
                // print(filteredItems[index].title);
                // print(filteredItems.length);
                if(!indexFilm.contains(index)){
                  indexFilm.add(index);
                }
                // print(indexFilm);
                // print(indexFilm.length);
                // if (indexFilm.length < 20) {
                //   _fetchMovies();
                // }
                // print(totalFilms.length);
                // if (index == totalFilms.length) {
                //   return const Center(child: CircularProgressIndicator());
                // }
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context,
                        FilmOfCategoryDetails.routeName,
                    arguments: totalFilms[index]);
                  }
                    ,child: FilmsOfCategory(selectedFilm: totalFilms, index: index));
              } else {
                return Container();
              }
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // void scrollViewControl() {}

  // Future<void> loadMoreItems() async {
  //   if (isLoading) return;
  //
  //   setState(() {
  //     isLoading = true;
  //   });
  //   await Future.delayed(Duration(milliseconds: 30));
  //
  //   setState(() {
  //     totalFilms.addAll(List.generate(20, (index) => totalFilms[index + 10]));
  //     isLoading = false;
  //   });
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController;
  }
}
