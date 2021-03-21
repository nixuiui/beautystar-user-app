import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';

class AppConst {

  static const domain         = "https://app.usahamu.co.id";
  static const apiHostDev     = "http://148.66.133.21/api/v1/";
  static const apiHost        = "http://148.66.133.21/api/v1/";
  bool isProducation          = false;

  static Color primary = Color(0xff0074e8);
  static Color accent = Color(0xffCFEAFF);
  static Color darkYellow = Color(0xffFCBF31);
  static Color orange = Colors.orange[500];
  static Color pink = Color(0xffD820A4);
  static Color blue = Color(0xff6095EA);
  static Color red = Color(0xffE70146);
  static Color darkGreen = Color(0xff3B7916);
  static Color whatsapp = Color(0xff25CC64);
  static Color white = Colors.white;
  static Color disabled = Colors.grey[400];
  static Color disabledButton = Colors.grey[300];
  static Color inputBorderBottom = Colors.grey[400];
  static Color border = Colors.grey[300];

  static BoxShadow boxShadow1 = BoxShadow(
    color: Colors.black45,
    offset: Offset(0, 0),
    blurRadius: 1,
    spreadRadius: -1
  );
  
  static BoxShadow boxShadow2 = BoxShadow(
    color: Colors.black45,
    offset: Offset(0, -2),
    blurRadius: 5,
    spreadRadius: -4
  );

  static BoxShadow boxShadow3 = BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 1),
    blurRadius: 3,
    spreadRadius: -1
  );
  
  static BoxShadow boxShadow4 = BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 3),
    blurRadius: 6,
    spreadRadius: -1
  );
  
  static Gradient gradientType1 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black.withOpacity(0.7)]
  );
  
  static Gradient gradientType2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff003EA1), Color(0xff9F0077)]
  );

  static List<NxOptions> listOfPeriode = [
    NxOptions(name: "Hari ini", value: 1),
    NxOptions(name: "Kemarin", value: 2),
    NxOptions(name: "2 hari lalu", value: 3),
    NxOptions(name: "3 hari lalu", value: 4),
    NxOptions(name: "Minggu ini", value: 5),
    NxOptions(name: "Minggu yang lalu", value: 6),
    NxOptions(name: "Bulan ini", value: 7),
    NxOptions(name: "Bulan yang lalu", value: 8),
    NxOptions(name: "Kustom periode", value: 9),
  ];
}