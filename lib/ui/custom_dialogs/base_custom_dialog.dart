import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType {
  base,
  form,
  error,
}

class BaseCustomDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const BaseCustomDialog({
    this.request,
    this.completer,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                NxText.title(
                  request.title
                ),
                const SizedBox(height: 10),
                Text(
                  request.description
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 15),
                NxButton.primary(
                  text: request.mainButtonTitle,
                  onPressed: () => completer(DialogResponse(confirmed: true)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => completer(DialogResponse(confirmed: false)),
            ),
          ),
        ],
      ),
    );
  }
}
