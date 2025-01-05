import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogMessage {
  static Future show({
    required BuildContext context,
    required String title,
    required Widget content,
    String? cancelActionText,
    required String? defaultActionText,
    VoidCallback? onPressedDefault,
  }) async {
    if (!Platform.isIOS) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: content,
          actions: <Widget>[
            if (cancelActionText != null)
              TextButton(
                child: Text(
                  cancelActionText,
                ),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            if (defaultActionText != null)
              TextButton(
                onPressed:
                    onPressedDefault ?? () => Navigator.of(context).pop(true),
                child: Text(
                  defaultActionText,
                ),
              ),
          ],
        ),
      );
    }

    // todo : showDialog for ios
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title,
        ),
        content: content,
        actions: <Widget>[
          if (cancelActionText != null)
            CupertinoDialogAction(
              child: Text(
                cancelActionText,
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          if (defaultActionText != null)
            CupertinoDialogAction(
              onPressed:
                  onPressedDefault ?? () => Navigator.of(context).pop(true),
              child: Text(
                defaultActionText,
              ),
            ),
        ],
      ),
    );
  }
}
