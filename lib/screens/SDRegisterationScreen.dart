import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/app_constants/sd_constants.dart';
import 'package:s_demo/extensions/num_extension.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/widgets/SDCommonStyle.dart';
import 'package:s_demo/widgets/app_widget.dart';


class SDRegisterationScreen extends StatefulWidget {
  static String tag = '/RegisterationScreen';

  @override
  _SDRegisterationScreenState createState() => _SDRegisterationScreenState();
}

class _SDRegisterationScreenState extends State<SDRegisterationScreen> {
  bool _isObscureText = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode fullNameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();

  @override
  void dispose(){
    super.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    fullNameFocus.dispose();
    addressFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          backgroundColor: SDColorPrimary,
          body: Stack(
            children: [
              logoContainer(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: fullNameCont,
                      focusNode: fullNameFocus,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value){
                        FocusScope.of(context).requestFocus(emailFocus);
                      },
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: blackColor),
                      decoration: TextFormStyle.textFormInputStyle("Full Name",),
                    ),
                    TextFormField(
                      controller: emailCont,
                      focusNode: emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value){
                        FocusScope.of(context).requestFocus(passwordFocus);
                      },
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: blackColor),
                      decoration: TextFormStyle.textFormInputStyle("Email",),
                    ),
                    TextFormField(
                      controller: passwordCont,
                      obscureText: _isObscureText,
                      focusNode: passwordFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value){
                        FocusScope.of(context).requestFocus(addressFocus);
                      },
                      style: TextStyle(color: blackColor),
                      decoration: TextFormStyle.passowrdFormInputStyle("Password", !_isObscureText, (){ setState(() {
                        _isObscureText = !_isObscureText;
                      });} ),
                    ),
                    TextFormField(
                      controller: addressCont,
                      focusNode: addressFocus,
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: blackColor),
                      decoration: TextFormStyle.textFormInputStyle("Your Address", suffixIcon: Icon(Icons.location_on, color: SDColorPrimary, size: 18,)),
                    ),
                    20.height,
                    elevatedButton((){
                      finish(context);
                    }, SDSignUp).defaultContainer(width),
                    24.height,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          finish(context);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: SDHAccount,
                            style: TextStyle(color: SDAppTextColorSecondary),
                            children: <TextSpan>[TextSpan(text: SDSignIn, style: TextStyle(color: SDColorPrimary))],
                          ),
                        ),
                      ),
                    ),
                    8.height,
                  ],
                ),
              ).backgroundContainer(height, width),
              BackButton(color: whiteColor, )
            ],
          ),
        )
    );
  }
}
