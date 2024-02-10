import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String errMessage) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errMessage),
    ),
  );
}
