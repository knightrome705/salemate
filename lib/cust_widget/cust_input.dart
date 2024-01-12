import 'package:flutter/material.dart';
import 'package:salemate/utils/app_color.dart';
class cust_input extends StatelessWidget {
  String type;
  Icon icon;
  Widget widget;
  bool obscure;
  var controller;
   cust_input({
    super.key,
     required this.type,
     required this.icon,
      required this.widget,
     required this.obscure,
     required this.controller

  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:icon,
      title:  Text(type,style: TextStyle(color: secondarColor),),
      subtitle: SizedBox(
        height: 40,
        child: TextFormField(
          controller: controller,
          obscureText:obscure ,
          decoration: const InputDecoration(
            border: InputBorder.none
          ),
        ),
      ),
           trailing: widget,
    );
  }
}