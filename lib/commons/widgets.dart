import 'package:flutter/cupertino.dart';

normalNavigation(BuildContext context, Widget widget) =>
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => widget,
      ),
    );

void keyboardDismiss(BuildContext context) {
  return FocusScope.of(context).unfocus();
}
