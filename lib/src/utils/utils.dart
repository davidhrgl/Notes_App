import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DialogAlert {
  final BuildContext context;
  final Widget title;
  final Widget content;

  const DialogAlert(this.context, this.title, this.content);

  Future<dynamic> showAlert(Function() onPressed) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _showAlertAndroid(onPressed);
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _showAlertIOS(onPressed);
    }
  }

  Future<dynamic> _showAlertAndroid(Function() onPressed) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AlertDialog(
                title: title,
                content: content,
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, "Cancel"),
                    child: const Text("Cancel"),
                  ),
                  TextButton(onPressed: onPressed, child: const Text("Ok"))
                ],
              ),
            ));
  }

  Future<dynamic> _showAlertIOS(Function() onPressed) async {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              onPressed: onPressed,
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
