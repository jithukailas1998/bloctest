import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

// https://pub.dev/packages/flutter_styled_toast/example
// Make resusable functions

void showtoastwidgetINFO({
  @required String message,
  @required BuildContext context,
}) {
  showToast(
    message,
    context: context,
    //backgroundColor: CustColor.ongreen,
    position: StyledToastPosition.bottom,
    animation: StyledToastAnimation.slideFromRightFade,
    reverseAnimation: StyledToastAnimation.fade,
    duration: Duration(seconds: 2),
    animDuration: Duration(seconds: 1),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}

void successToastBottom(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    textColor: Colors.black,
    fontSize: 20.0,
  );
}
