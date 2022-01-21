import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/app_constants/sd_constants.dart';
import 'package:s_demo/extensions/num_extension.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/screens/SDResetPasswordScreen.dart';
import 'package:s_demo/widgets/app_widget.dart';


class SDVerificationScreen extends StatefulWidget {
  static String tag ='/VerificationScreen';

  @override
  _SDVerificationScreenState createState() => _SDVerificationScreenState();
}

class _SDVerificationScreenState extends State<SDVerificationScreen> {

  FocusNode firstDigit = FocusNode();
  FocusNode secondDigit = FocusNode();
  FocusNode thirdDigit = FocusNode();
  FocusNode fourthDigit = FocusNode();
  FocusNode fifthDigit = FocusNode();

  int _counter =0;
  Timer? _timer;

  void _startTimer(){
    _counter = 10;
    if(_timer != null){
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      setState(() {
        if(_counter > 0){
          _counter --;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose(){
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    _startTimer();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: SDColorPrimary,
      body: Stack(
        children: [
          backButton(context),
          Positioned(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(SDVerification, style: TextStyle(color: SDAppTextColorPrimary , fontWeight: FontWeight.bold, fontSize: 16),),
              16.height,
              Text(SDVerificationTxt, style: TextStyle(color: SDAppTextColorSecondary, fontSize: 14),),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: blackColor),
                    keyboardType: TextInputType.number,
                    onChanged: (String newVal){
                      if(newVal.length == 1) {
                        firstDigit.unfocus();
                        FocusScope.of(context).requestFocus(secondDigit);
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                    ),
                  ).defaultContainer(50, height: 60),
                  TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: blackColor),
                    keyboardType: TextInputType.number,
                    onChanged: (String newVal){
                      if(newVal.length == 1) {
                        secondDigit.unfocus();
                        FocusScope.of(context).requestFocus(thirdDigit);
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                    ),
                  ).defaultContainer(50, height: 60),
                  TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: blackColor),
                    keyboardType: TextInputType.number,
                    onChanged: (String newVal){
                      if(newVal.length == 1) {
                        thirdDigit.unfocus();
                        FocusScope.of(context).requestFocus(fourthDigit);
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                    ),
                  ).defaultContainer(50, height: 60),
                  TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: blackColor),
                    keyboardType: TextInputType.number,
                    onChanged: (String newVal){
                      if(newVal.length == 1) {
                        fourthDigit.unfocus();
                        FocusScope.of(context).requestFocus(fifthDigit);
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                    ),
                  ).defaultContainer(50, height: 60),
                  TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: blackColor),
                    keyboardType: TextInputType.number,
                    onChanged: (String newVal){
                      if(newVal.length == 1) {
                        fifthDigit.unfocus();
                        FocusScope.of(context).requestFocus(fifthDigit);
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: SDColorPrimary)),
                    ),
                  ).defaultContainer(50, height: 60),

                ],
              ),
              20.height,
              Padding(padding: EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        _startTimer();
                      },
                      child: Text(SDTxtResendOn, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: SDColorPrimary),),
                    ),
                    8.height,
                    Text('0: $_counter', style: TextStyle(color: SDColorPrimary, fontSize: 14, fontWeight: FontWeight.bold),)
                  ],
                ),),
              16.height,
              elevatedButton((){
                finish(context);
                SDResetPasswordScreen().launch(context);
              }, 'Continue')
            ],
          ).backgroundContainer(height, width))
        ],
      ),
    ));
  }
}
