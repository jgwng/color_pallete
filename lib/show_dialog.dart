import 'package:colorpallete/login_n_signup_dialog.dart';
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

void showAuthDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return LoginNSignUpDialog();
    },
  );
}