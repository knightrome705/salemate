import 'package:flutter/material.dart';
import 'package:salemate/app_store/app_store.dart';
import 'package:salemate/routes/name_routes.dart';
import '../models/repository/repository.dart';
import '../utils/common_toast.dart';

class LoginProvider with ChangeNotifier{
  final _appRepository=AppRepository();

  bool _isLoading=false;
  bool get isLoading => _isLoading;
  setLoading(bool value){
    _isLoading=value;
    notifyListeners();
  }

  Future<void> userLogin(dynamic data,BuildContext context)async{
    setLoading(true);
    _appRepository.userLogin(data).then((value) {
      print(value.toString());
      if(value.data['tocken']!=''){
        commonToast("welcome");
      }else{
        Navigator.pushNamed(context, RouteName.HomePage);
      }
      AppStore().setUserTocken(value['tocken']);
      setLoading(false);
    }).onError((error, stackTrace) {
      commonToast("Something went wrong");
      setLoading(false);
    });
  }
}