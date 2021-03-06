

import 'package:colorpallete/ui/widget/dialog/auth_dialog/login_dialog/login_dialog.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog/signup_dialog/signup_dialog.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog/withdrawal_dialog/withdrawal_dialog.dart';
import 'package:colorpallete/ui/widget/dialog/palette_detail_dialog/palette_detail_dialog.dart';
import 'package:colorpallete/ui/widget/dialog/info_save_dialog/color_save_dialog.dart';
import 'package:colorpallete/ui/widget/dialog/info_save_dialog/palette_save_dialog.dart';
import 'package:colorpallete/ui/widget/dialog/saved_info_dialog/saved_palette_dialog/saved_palette_dialog.dart';
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

void showColorSaveDialog(BuildContext context,Color color){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return ColorSaveDialog(color : color);
    },
  );
}

void showPaletteSaveDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return PaletteSaveDialog();
    },
  );
}

void showWithdrawalDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return WithdrawalDialog();
    },
  );
}


void showSavedPaletteDialog(BuildContext context,bool isMulti){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return SavedPaletteDialog(isMulti: isMulti,);
    },
  );
}