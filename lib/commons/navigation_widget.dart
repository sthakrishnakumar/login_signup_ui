import 'package:flutter/cupertino.dart';

normalNavigation(BuildContext context, Widget widget) =>
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => widget,
      ),
    );
