// ignore_for_file: file_names

import 'dart:convert';
import 'package:movies_app/api_response/apiConstants.dart';
import 'package:http/http.dart' as http;
import 'RatedResponse.dart';

class RatedApiManager{
  static Future<RatedResponse?>getData() async {
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.topRatedPath, {
      'api_key': ApiConstants.apiKey,
      'Authorization': ApiConstants.authorization
    });
    try{
      var response = await http.get(url);
      var jason = jsonDecode(response.body);
      await Future.delayed(Duration(seconds: 3));
      return RatedResponse.fromJson(jason);
    }
    catch (e){
      rethrow ;
    }
  }
}