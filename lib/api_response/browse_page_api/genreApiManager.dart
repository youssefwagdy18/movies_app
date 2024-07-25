// ignore_for_file: file_names

import 'dart:convert';
import 'package:movies_app/api_response/apiConstants.dart';
import 'package:http/http.dart' as http;
import 'GenreIdResponse.dart';

class GenreApiManager {
  static Future<GenreIdResponse?> getData() async {
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.movieListGenres, {
      'api_key': ApiConstants.apiKey,
      'Authorization': ApiConstants.authorization
    });
    try {
      var response = await http.get(url);
      var jason = jsonDecode(response.body);
      return GenreIdResponse.fromJson(jason);
    } catch (e) {
      rethrow;
    }
  }
}
