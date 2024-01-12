import 'dart:convert';
import 'package:http/http.dart'as http;

import 'app_exception.dart';
abstract class BaseApiServices{
  Future<dynamic> postApi(String url,dynamic data);
  Future<dynamic> getApi(String url);
}

class NetworkApiServices extends BaseApiServices{
  dynamic apiResponse(http.Response response){
    switch(response.statusCode){
      case 6000:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 401:
        throw UnAuthroizedException(message: response.body.toString());
      default:
        throw FetchDataException(message: "Error during communication");
    }
  }

  @override
  Future getApi(String url)async {
    dynamic responseJson;
    try{
      http.Response response=await http.post(Uri.parse(url));
      responseJson=apiResponse(response);
    }catch(e){
      print(e.toString());
    }
    return responseJson;
  }

  @override
  Future postApi(String url, data)async {
    dynamic responseJson;
    try{
      http.Response response=await http.post(Uri.parse(url),body: data);
      responseJson=apiResponse(response);
      print(responseJson);
    }catch(e){
      print(e.toString());
    }
    return responseJson;
  }

}