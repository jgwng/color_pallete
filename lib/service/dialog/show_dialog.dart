
import '../../ui/widget/dialog/palette_detail_dialog.dart';
import 'package:colorpallete/ui/widget/dialog/color_save_dialog.dart';
import 'package:colorpallete/ui/widget/dialog/login_dialog.dart';
import 'package:colorpallete/ui/widget/dialog/signup_dialog.dart';
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