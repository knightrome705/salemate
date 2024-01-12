import 'package:flutter/material.dart';
import 'package:salemate/routes/name_routes.dart';
import 'package:salemate/routes/routes.dart';
import 'package:salemate/view/login.dart';
import 'package:salemate/view/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3:true ,
      ),
      initialRoute: RouteName.Login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
