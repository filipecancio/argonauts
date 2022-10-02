import 'dart:async';
import 'package:argonauts/common/message/message_animation.dart';
import 'package:flutter/material.dart';

class MessageController {
  static late Timer toastTimer;
  static late OverlayEntry _overlayEntry;

  static void showCustomToast(BuildContext context, String message) {
    _overlayEntry = createOverlayEntry(context, message);

    toastTimer = Timer(Duration(seconds: 2), () {});
  }

  static OverlayEntry createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
        builder: (context) => Positioned(
              top: 50.0,
              width: MediaQuery.of(context).size.width - 20,
              left: 10,
              child: ToastMessageAnimation(Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffe53e3f),
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              )),
            ));
  }
}
