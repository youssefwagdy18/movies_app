// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/api_response/apiConstants.dart';
import 'TopSectionResponse.dart';


class TopSectionApiManager{
  static Future<TopSectionResponse?>getData()async{
    var url = Uri.https(ApiConstants.baseUrl,ApiConstants.topSectionPath,{
      'api_key': ApiConstants.apiKey ,
      'Authorization':ApiConstants.authorization
    });
    try {
      var response = await http.get(url);
      var jason = jsonDecode(response.body);
      await Future.delayed(Duration(seconds: 2));
      return TopSectionResponse.fromJson(jason);
    }
    catch(e){
      rethrow;
    }
  }
}
