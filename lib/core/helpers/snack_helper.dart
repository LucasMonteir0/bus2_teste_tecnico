import 'package:flutter/material.dart';

class SnackHelper {
  SnackHelper._();

  static void showError({
    required BuildContext context,
    required String message,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  static void show({required BuildContext context, required String message}) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static void _showSnackBar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    required Color textColor,
  }) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
