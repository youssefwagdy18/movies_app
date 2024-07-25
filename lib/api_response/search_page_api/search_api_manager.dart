import 'dart:convert';

import 'package:movies_app/api_response/apiConstants.dart';
import 'package:movies_app/api_response/search_page_api/SearchResponse.dart';
import 'package:http/http.dart' as http;


class SearchApiManager{
  static Future<SearchResponse>? getData(String q)async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.searchMovies,
        {
          'api_key': ApiConstants.apiKey,
          'Authorization' :ApiConstants.authorizationFilmsGenres,
          'query':q
        });
    try{
      var response=await http.get(url);
      var jason = jsonDecode(response.body);
      print(jason.toString());
      var dynamicList= SearchResponse.fromJson(jason);
      return dynamicList;
    }catch(e){
      print(e);
      throw Exception('Failed to load movies');
    }
}
}