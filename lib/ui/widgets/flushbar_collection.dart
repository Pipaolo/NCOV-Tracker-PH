import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

final Flushbar noInternetConnectionFlushbar = Flushbar(
  flushbarPosition: FlushbarPosition.TOP,
  message: 'No Internet Connection.',
  backgroundColor: Colors.red,
  isDismissible: false,
);
