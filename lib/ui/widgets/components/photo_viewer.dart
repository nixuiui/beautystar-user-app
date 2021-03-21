import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {

  final String imageNetwork;

  PhotoViewer({this.imageNetwork});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        title: Text(''),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(imageNetwork),
        )
      )
    );
  }
}