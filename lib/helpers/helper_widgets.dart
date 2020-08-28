import 'package:flutter/material.dart';

mixin WidgetHelper {
  Future<T> alertMessage<T>(BuildContext context, String title,
      {Widget content, List<Widget> actions, bool dissmisible = false}) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: dissmisible,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(title),
          content: content ?? Container(height: 0, width: 0),
          actions: actions ??
              <Widget>[
                FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('OK'))
              ],
        );
      },
    );
  }
}
