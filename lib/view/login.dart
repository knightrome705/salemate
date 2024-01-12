import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salemate/app_store/app_store.dart';
import 'package:salemate/routes/name_routes.dart';
import 'package:salemate/utils/app_color.dart';
import 'package:salemate/utils/app_style.dart';

import '../cust_widget/cust_input.dart';
import '../view_model/login_provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  String token = '';

  getTocken() {
    AppStore().getUsertocken().then((value) {
      setState(() {
        token = value;
        print(token);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getTocken();
    Future.delayed(const Duration(seconds: 3), () {
      if (token == "") {
        Navigator.pushNamed(context, RouteName.HomePage);
      } else {
        Navigator.pushNamed(context, RouteName.Login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.02),
                    child: Text(
                      "English",
                      style: Style.heading2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.09),
              Text("Login", style: Style.heading1),
              const Text("Login to vikin account"),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.20,
                margin: EdgeInsets.all(width * 0.09),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(width * 0.05),
                ),
                child: Column(
                  children: [
                    cust_input(
                      controller: email,
                      icon: Icon(Icons.person, color: primaryColor),
                      type: "Username",
                      widget: SizedBox(height: height * 0.01),
                      obscure: false,
                    ),
                    cust_input(
                      controller: pass,
                      icon: Icon(Icons.key, color: primaryColor),
                      type: "password",
                      widget: Icon(Icons.remove_red_eye_outlined,
                          color: primaryColor),
                      obscure: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Text("Forgot Password?", style: Style.subtitle1),
              SizedBox(
                height: height * 0.01,
                width: width * 0.03,
              ),
              ElevatedButton(
                onPressed: () {
                  Map data = {
                    "username": email.text.toString(),
                    "password": pass.text.toString(),
                    "is_mobile": 'true'
                  };
                  loginProvider.userLogin(data, context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(fontSize: 18, color: whiteColor),
                    ),
                    SizedBox(width: width * 0.02),
                    const Icon(
                      Icons.arrow_forward,
                      size: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.05),
              const Text("Don't have an Account?"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Signup now!", style: Style.subtitle1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
