import 'package:colorpallete/app_themes.dart';
import 'package:flutter/material.dart';
class AuthTFT extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Icon? suffixIcon;
  final bool obscureText;
  final FocusNode? focusNode;
  final Function(String)? function;
  final Function(String)? submitFunction;

  const AuthTFT({required this.labelText, this.validator,required this.controller,this.focusNode,this.submitFunction,
    this.function, this.suffixIcon, this.obscureText = false, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      margin: EdgeInsets.only(top:20),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        focusNode: focusNode,
        cursorColor: Colors.black,
        validator: validator,
        style: AppThemes.textTheme.bodyText1!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: function,
        onFieldSubmitted: submitFunction,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey),
            errorStyle: AppThemes.textTheme.bodyText2!.copyWith(color: Colors.red),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color: AppThemes.pointColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.black),
            )),
      ),
    );
  }
}