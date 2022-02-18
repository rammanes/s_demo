import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/app_constants/sd_constants.dart';
import 'package:s_demo/extensions/num_extension.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/screens/SDDecisionPage.dart';


class SDEmailVerification extends StatefulWidget {
  static String tag ='/EmailVerificationScreen';

  @override
  _SDEmailVerificationState createState() => _SDEmailVerificationState();
}

class _SDEmailVerificationState extends State<SDEmailVerification> {
  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void initState(){
    user = auth.currentUser;
    user!.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Container(
              padding: EdgeInsets.all(8),
              height: height * 1/6,
              child: Card(
                shadowColor: SDColorPrimary,
                elevation: 8,
                child: Container(
                  padding: EdgeInsets.only(left: 12, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Email Verification', style: TextStyle(color: SDAppTextColorPrimary , fontWeight: FontWeight.bold, fontSize: 16),),
                      16.height,
                      Text('An Email has been sent to ${user!.email} please verify', style: TextStyle(color: SDAppTextColorSecondary, fontSize: 14),),
                      20.height,
                    ],
                  ),
                )),
              ),
      ),
    ));
  }
  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user!.reload();
    if(user!.emailVerified){
      timer!.cancel();
      SDDecisionPage().launch(context);
    }
  }

}
