import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';
class AuthTFT extends StatefulWidget {

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
  _AuthTFTState createState() => _AuthTFTState();
}

class _AuthTFTState extends State<AuthTFT>{
  bool? isObscureText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isObscureText = widget.obscureText;

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      margin: EdgeInsets.only(top:20),
      child: TextFormField(
        obscureText: (widget.labelText == '비밀번호') ? isObscureText! : widget.obscureText,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        controller: widget.controller,
        focusNode: widget.focusNode,
        cursorColor: Colors.black,
        validator: widget.validator,
        style: AppThemes.textTheme.bodyText1!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.function,
        onFieldSubmitted: widget.submitFunction,
        decoration: InputDecoration(
            labelText: widget.labelText,
            suffixIcon: (widget.labelText == '비밀번호') ? IconButton(
              onPressed: (){
                setState(() {
                  isObscureText = !isObscureText!;
                });
              },
              icon: Icon(isObscureText! ? Icons.visibility_off : Icons.visibility),
            ) : null,
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