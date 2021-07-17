import 'package:colorpallete/color_save_dialog.dart';
import 'package:colorpallete/login_dialog.dart';
import 'package:colorpallete/signup_dialog.dart';
import 'package:colorpallete/palette_detail_dialog.dart';
import 'package:flutter/material.dart';

void  showPaletteDetailDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return PaletteDetailDialog();
    },
  );
}

void showSignUpDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return SignUpDialog();
    },
  );
}

void showLoginDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return LoginDialog();
    },
  );
}

void showColorSaveDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return ColorSaveDialog();
    },
  );
}