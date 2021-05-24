import 'package:flutter/material.dart';
import 'package:yachaq/app/ui/dialog/loading/base_loading.dart';

class DialogHelper {
  static loading(context) => showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      barrierDismissible: false,
      builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: BaseLoadingPage()
      ));
}