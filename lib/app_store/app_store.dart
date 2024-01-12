import 'package:shared_preferences/shared_preferences.dart';

class AppStore{
  setUserTocken(String value)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("user_tocken", value);
  }
  Future<String> getUsertocken()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    String? usertocken=sp.getString('user_tocken');
    return usertocken??"";
  }
  removeTocken()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.remove('user_tocken');
  }
}