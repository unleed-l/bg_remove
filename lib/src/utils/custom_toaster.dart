import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

class CustomToast {
  static CherryToast warningToast(String text) => CherryToast.warning(
        title: Text(
          text,
          style: TextStyle(
            color: Colors.amber.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
        shadowColor: Colors.transparent,
        toastPosition: Position.top,
        displayCloseButton: false,
        animationType: AnimationType.fromTop,
      );

  static CherryToast errorToast(String text) => CherryToast.error(
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
        shadowColor: Colors.transparent,
        toastPosition: Position.top,
        displayCloseButton: false,
        animationType: AnimationType.fromTop,
      );

  static CherryToast successToast(String text) => CherryToast.success(
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        shadowColor: Colors.transparent,
        toastPosition: Position.top,
        displayCloseButton: false,
        animationType: AnimationType.fromTop,
      );

  static CherryToast infoToast(String text) => CherryToast.info(
        title: Text(
          text,
          style: TextStyle(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.w600,
          ),
        ),
        shadowColor: Colors.transparent,
        toastPosition: Position.top,
        displayCloseButton: false,
        animationType: AnimationType.fromTop,
      );
}
