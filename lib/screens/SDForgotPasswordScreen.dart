import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/app_constants/sd_constants.dart';
import 'package:s_demo/extensions/num_extension.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/screens/SDVerificationScreen.dart';
import 'package:s_demo/widgets/SDCommonStyle.dart';
import 'package:s_demo/widgets/app_widget.dart';



class SDForgotPasswordScreen extends StatefulWidget {
  static String tag = '/ForgotPasswordScreen';

  @override
  _SDForgotPasswordScreenState createState() => _SDForgotPasswordScreenState();
}

class _SDForgotPasswordScreenState extends State<SDForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          backgroundColor: SDColorPrimary,
          body: Stack(
            children: [
              backButton(context),
              Positioned(
                top: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(SDTxtForgotPwd, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: SDAppTextColorSecondary ),),
                    16.height,
                    Text(SDTxtForgotPwdHelp, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: SDAppTextColorSecondary),),
                    24.height,
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: blackColor),
                      decoration: TextFormStyle.textFormInputStyle('Email'),
                    ),
                    24.height,
                    elevatedButton((){
                      finish(context);
                      SDVerificationScreen().launch(context);
                    }, 'Send').defaultContainer(width)
                  ],
                ).backgroundContainer(height, width),
              )
            ],
          ),
        )
    );
  }
}
