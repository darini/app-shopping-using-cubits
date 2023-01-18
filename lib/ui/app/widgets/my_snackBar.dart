import 'package:flutter/material.dart';

class MySackBar extends SnackBar {
  final String? message;

  MySackBar({required this.message})
      : super(
          content: Text(
            message!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blue,
        );

  MySackBar.success({required this.message})
      : super(
          content: Text(
            message!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        );

  MySackBar.error({required this.message})
      : super(
          content: Text(
            message!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        );

  MySackBar.information({required this.message})
      : super(
          content: Text(
            message!,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.black38,
        );
}
