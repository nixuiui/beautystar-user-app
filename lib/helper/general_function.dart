import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

backButton(BuildContext context, {Color color}) {
  return IconButton(
    icon: Icon(Icons.arrow_back, color: color ?? Colors.black),
    onPressed: () => Navigator.pop(context),
  );
}

PreferredSize appBarBorderBottom() {
  return PreferredSize(
    preferredSize: Size.fromHeight(1),
    child: Divider()
  );
}