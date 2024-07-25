// ignore_for_file: file_names

import 'dart:convert';
import 'package:movies_app/api_response/apiConstants.dart';
import 'package:http/http.dart' as http;
import 'FilmsGenresResponse.dart';

class FilmsGenresApiManager {
  static Future<FilmsGenresResponse?> getData(int page) async {
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.filmsGenresBrowse, {
      'api_key': ApiConstants.apiKey,
      'Authorization': ApiConstants.authorizationFilmsGenres,
      'page':"$page"
    });
    try {
      var response = await http.get(url);
      var jason = jsonDecode(response.body);
      return FilmsGenresResponse.fromJson(jason);
    } catch (e) {
      rethrow;
    }
  }
}
