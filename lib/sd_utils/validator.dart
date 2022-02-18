import 'package:flutter/material.dart';


class ValidatorHelper{

  static String? validatePassword({required String password}){
    if(password.isEmpty){
      return "Password field can't be empty";
    }else if(password.length < 6){
      return "Password length can't be less than 8";
    }
    return null;
  }
}