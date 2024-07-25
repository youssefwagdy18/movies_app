import 'package:flutter/material.dart';
import 'package:movies_app/api_response/search_page_api/SearchResponse.dart';

import 'package:movies_app/api_response/search_page_api/search_api_manager.dart';
import 'package:movies_app/features/page_search/search_item.dart';

class SearchMovie extends SearchDelegate {
  @override
  TextStyle get searchFieldStyle => const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.blue,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.blue,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<SearchResponse?>(
      future: SearchApiManager.getData(query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text(
            'Error: ${snapshot.error}',
            style: const TextStyle(color: Colors.white),
          ));
        } else if (snapshot.hasData) {
          var results = snapshot.data!.results ?? [];
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return SearchItem(searchedFilms: results, index: index);
            },
          );
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        ));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<SearchResponse?>(
      future: SearchApiManager.getData(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No results found'));
        } else {
          var results = snapshot.data!.results ?? [];
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return SearchItem(searchedFilms: results, index: index);
            },
          );
        }
      },
    );
  }
}
