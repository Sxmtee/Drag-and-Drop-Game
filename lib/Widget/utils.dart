// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Utils {
  static void showSnackBar(
    BuildContext context, {
    required String text,
    required Color color,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      SizedBox(
        height: 100,
        child: CustomSnackBar.info(
          backgroundColor: color,
          message: text,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
