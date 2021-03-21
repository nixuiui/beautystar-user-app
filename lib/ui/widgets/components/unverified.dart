import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';

class UnverifiedWidget extends StatelessWidget {

  final VoidCallback onPressed;

  const UnverifiedWidget({
    Key key,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/unverified.png",
            width: 200,
          ),
          NxText.subtitle("You haven't verified yet."),
          SizedBox(height: 32),
          NxButton(
            text: "Verify Account",
            onPressed: onPressed,
          ),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}