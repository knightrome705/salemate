import 'package:flutter/material.dart';
import 'package:salemate/utils/app_color.dart';

import '../cust_widget/user_view.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Estimation"),
        actions: [
          Icon(Icons.add,color: primaryColor,)
        ],
      ),
      body:Column(
        children: [
        Container(
          color: secondarColor,
          child: const ListTile(
            title: Text("search"),
            trailing: Icon(Icons.search),
          ),
        ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context,snapshot) {
                return User_wiew(
                      custm_name: "martin",
                      price: 100,
                    );
              }
            ),
          ),
        ],
      )
    );
  }
}
