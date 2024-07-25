// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/api_response/apiConstants.dart';
import 'package:movies_app/api_response/upcomming_api/UpcommingResponse.dart';

class UpcommingApiManager {

static Future<UpcommingResponse?>getData() async{

var url = Uri.https(ApiConstants.baseUrl, ApiConstants.upcommingPath, {
  'api_key': ApiConstants.apiKey,
  'Authorization': ApiConstants.authorization
});

try {
  var response = await http.get(url);
  var jason = jsonDecode(response.body);
  await Future.delayed(Duration(seconds: 1));
  return UpcommingResponse.fromJson(jason);
}
catch(e){
  rethrow;
}

}
}