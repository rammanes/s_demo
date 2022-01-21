import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_demo/app_constants/sd_constants.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/screens/SDWalkThroughScreen.dart';

class SDSplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  @override
  _SDSplashScreenState createState() => _SDSplashScreenState();
}

class _SDSplashScreenState extends State<SDSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async{
    Timer(Duration(seconds: 2),(){
      finish(context);
      // Navigate to the walk through screen after 2 seconds of displaying the splash screen
      SDWalkThroughScreen().launch(context);
    }
    );
  }

  @override
  void setState(fn){
    if(mounted) super.setState(fn);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(sdLogo, height: 140, width: 140,),
      ),
    );
  }
}
