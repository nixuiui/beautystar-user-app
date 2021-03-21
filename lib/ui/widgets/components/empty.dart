import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_button.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text.dart';

class EmptyWidget extends StatelessWidget {

  final VoidCallback onPressed;
  final String message;
  final String buttonText;

  const EmptyWidget({
    Key key,
    this.onPressed,
    this.message,
    this.buttonText,
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
            "assets/empty.png",
            width: 200,
          ),
          NxText("Your data is empty.", fontSize: 20),
          SizedBox(height: 16),
          NxButton(
            text: buttonText ?? 'Refresh',
            onPressed: onPressed
          )
        ],
      ),
    );
  }
}