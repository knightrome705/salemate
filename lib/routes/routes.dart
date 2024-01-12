

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salemate/view/Homepage.dart';
import 'package:salemate/view/login.dart';
import 'package:salemate/view_model/login_provider.dart';

import 'name_routes.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.Login:
        return MaterialPageRoute(
          builder: (context) =>ChangeNotifierProvider(
            create: (context) => LoginProvider(),
            child: LoginPage()
          )
        );

      case RouteName.HomePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Something went wrong"),
            ),
          ),
        );
    }
  }
}
