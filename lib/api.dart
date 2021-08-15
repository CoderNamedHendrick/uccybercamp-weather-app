import 'dart:convert';
import 'dart:io';
;
import 'package:http/http.dart' as http;

class ApiService{
  Future<dynamic> get({required String searchName, required String appId}) async{
    var responseJson;
    try{
      final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$searchName&units=metric&appid=$appId',));
      responseJson = _returnResponse(response);
    } on SocketException{
      throw Exception('No internet connection');
    }
    return responseJson;
  }
}

dynamic _returnResponse(http.Response response){
  switch(response.statusCode){
    case 200:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson;
    case 400:
      throw Exception('${response.body}, Invalid Request');
    case 401:
    case 403:
      throw Exception('${response.body}, Unauthorized Call');
    case 500:
    default:
      throw Exception('Error occurred while Communicating with Server with status : ${response.statusCode}',);
  }
}