import 'package:flutter/material.dart';

class AppGeneralWidget {
  static PreferredSize appBarBorderBottom = PreferredSize(
    preferredSize: Size.fromHeight(1),
    child: Divider()
  );
  
  static Widget dotIcon = Container(
    width: 3,
    height: 3,
    margin: EdgeInsets.symmetric(horizontal: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)
    ),
  );
  
  static backButton(BuildContext context, {Color color}) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: color ?? Colors.white),
      onPressed: () => Navigator.pop(context),
    );
  }
}