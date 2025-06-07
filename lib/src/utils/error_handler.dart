import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// A utility class for handling errors consistently across the app.
class ErrorHandler {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  /// Logs an error and shows a snackbar with the error message.
  static void handleError(BuildContext context, dynamic error, [StackTrace? stackTrace]) {
    _logger.e('Error occurred', error: error, stackTrace: stackTrace);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred: ${error.toString()}'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  /// Logs an info message.
  static void logInfo(String message) {
    _logger.i(message);
  }

  /// Logs a warning message.
  static void logWarning(String message) {
    _logger.w(message);
  }

  /// Logs a debug message.
  static void logDebug(String message) {
    _logger.d(message);
  }
} 