import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:flutter/material.dart';

class TextFormStyle {
  static InputDecoration textFormInputStyle(String s ,{suffixIcon}) =>
      InputDecoration(
        labelText: s,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(color: SDGreyColor, fontSize: 14),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: SDAppDividerColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: SDColorPrimary)),
      );

  static InputDecoration passowrdFormInputStyle(String s, bool isObscureText,
      Function() onTap) =>
      InputDecoration(
          labelText: s,
          labelStyle: TextStyle(color: SDGreyColor, fontSize: 14),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: SDAppDividerColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: SDColorPrimary)),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(isObscureText ? Icons.visibility : Icons.visibility_off,
              color: SDColorPrimary, size: 20,),
          )
      );
}
