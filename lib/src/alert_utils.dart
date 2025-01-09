import 'package:flutter/material.dart';
import 'package:adaptive_design_utils/flutter_responsive_utils.dart';

/// Utility class for showing various types of alerts and notifications
class Alert {
  /// Private constructor to prevent instantiation
  Alert._();

  /// Show a custom error dialog
  static Future<void> showErrorDialog(
    BuildContext context, {
    required String message,
    String title = 'Error',
    String? buttonText,
    VoidCallback? onClose,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.red,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(fontSize: 16.sp),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onClose?.call();
            },
            child: Text(
              buttonText ?? 'OK',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Show a success dialog
  static Future<void> showSuccessDialog(
    BuildContext context, {
    required String message,
    String title = 'Success',
    String? buttonText,
    VoidCallback? onClose,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.green,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(fontSize: 16.sp),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onClose?.call();
            },
            child: Text(
              buttonText ?? 'OK',
              style: TextStyle(
                color: Colors.green,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Show a warning dialog
  static Future<void> showWarningDialog(
    BuildContext context, {
    required String message,
    String title = 'Warning',
    String? buttonText,
    VoidCallback? onClose,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.orange,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(fontSize: 16.sp),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onClose?.call();
            },
            child: Text(
              buttonText ?? 'OK',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Show a confirmation dialog
  static Future<bool> showConfirmationDialog(
    BuildContext context, {
    required String message,
    String title = 'Confirm',
    String confirmText = 'Yes',
    String cancelText = 'No',
    bool barrierDismissible = true,
  }) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: barrierDismissible,
          builder: (context) => AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              message,
              style: TextStyle(fontSize: 16.sp),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  cancelText,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  confirmText,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  /// Show a custom snackbar
  static void showSnackBar(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Color? textColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    // Remove any existing SnackBars
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16.sp,
          ),
        ),
        backgroundColor: backgroundColor ?? Colors.black,
        duration: duration,
        behavior: behavior,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
      ),
    );
  }

  /// Show an error snackbar
  static void showErrorSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      duration: duration,
    );
  }

  /// Show a success snackbar
  static void showSuccessSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      duration: duration,
    );
  }

  /// Show a warning snackbar
  static void showWarningSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      duration: duration,
    );
  }
}
