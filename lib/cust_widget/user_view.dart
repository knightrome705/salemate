
import 'package:flutter/material.dart';
import 'package:salemate/utils/app_color.dart';

class User_wiew extends StatelessWidget {
  String custm_name;
  int price;
   User_wiew({
    super.key,
    required this.custm_name,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("#Invoice No"),
      subtitle: Text(custm_name),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pending",style: TextStyle(color: teretaryColor),),
          Text(price.toString())
        ],
      ),
    );
  }
}
