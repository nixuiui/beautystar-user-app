import 'package:flutter/material.dart';

class MuaItemSquare extends StatelessWidget {
  const MuaItemSquare({
    Key key,
    @required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.transparent, 
              width: 0
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("http://www.beautystar.id/image/makeup-6.jpg")
            )
          ),
        ),
      ],
    );
  }
}