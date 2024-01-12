
import '../sevices/network_services.dart';

class AppRepository{
  final BaseApiServices _apiServices=NetworkApiServices();
  String baseurl="https://api.accounts.vikncodes.com/api";
  Future<dynamic> userLogin(dynamic data) async {
    var response=await _apiServices.postApi("$baseurl${"/v1/users/login"}", data);
    try{
      print(response);
      return response;

    }catch(e){
      print(e.toString());
    }
  }
}