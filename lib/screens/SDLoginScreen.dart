import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/app_constants/sd_constants.dart';
import 'package:s_demo/extensions/num_extension.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/screens/SDDashboardScreen.dart';
import 'package:s_demo/screens/SDForgotPasswordScreen.dart';
import 'package:s_demo/screens/SDRegisterationScreen.dart';
import 'package:s_demo/sd_utils/validator.dart';
import 'package:s_demo/widgets/SDCommonStyle.dart';
import 'package:s_demo/widgets/app_widget.dart';
import 'package:s_demo/authentication/auth.dart';

class SDLoginScreen extends StatefulWidget {
  static String tag = '/LoginScreen';

  @override
  _SDLoginScreenState createState() => _SDLoginScreenState();
}

class _SDLoginScreenState extends State<SDLoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool _showPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _signInWithEmailPassword() async{
    final form = _formKey.currentState;
    if(form!.validate()){
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      await AuthenticationHelper().signIn(email, password, context);
    }
  }

  @override
  void dispose(){
    super.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String labelTextStr;
    return SafeArea(
      child: Scaffold(
        backgroundColor: SDColorPrimary,
        body: Stack(
          children: [
            logoContainer(),
            Form(
              key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocus,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(passwordFocus);
                        },
                        style: TextStyle(color: blackColor),
                        decoration: TextFormStyle.textFormInputStyle("Email"),
                        validator: (email)=> email !=null && !EmailValidator.validate(email) ?'Enter a valid email': null,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: !_showPassword,
                        focusNode: passwordFocus,
                        style: TextStyle(color: blackColor),
                        validator: (value)=> ValidatorHelper.validatePassword(password: value!),
                        decoration: TextFormStyle.passowrdFormInputStyle("Password", _showPassword, (){
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        }),
                      ),
                      20.height,
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Text(SDFPassword, style: TextStyle(fontSize: 15, color: SDAppTextColorSecondary),),
                          onTap: () {

                            SDForgotPasswordScreen().launch(context);
                          },
                        ),
                      ),
                      20.height,
                      elevatedButton((){
                        _signInWithEmailPassword();
                        }, SDSignIn).defaultContainer(width),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Container(height: 1, margin: EdgeInsets.only(right: 8.0), color: SDAppDividerColor,)),
                          Text(SDSoptions, style: TextStyle(color: SDGreyColor),),
                          Expanded(child: Container(height: 1, margin: EdgeInsets.only(left: 8.0), color: SDAppDividerColor,)),
                        ],
                      ),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(googleIcon, height: 42, width: 42,),
                            onTap: (){
                              AuthenticationHelper().signInWithGoogle();
                            },
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(twitterIcon, height: 42, width: 42,),
                            onTap: (){
                              AuthenticationHelper().signInWithTwitter().then((_) =>
                                SDDashboardScreen().launch(context)
                              );
                            },

                          ),
                          GestureDetector(
                            child: SvgPicture.asset(facebookIcon, height: 42, width: 42,),
                            onTap: (){
                              AuthenticationHelper().signInWithFacebook();
                            },
                          )
                        ],
                      ),
                      40.height,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: (){
                            SDRegisterationScreen().launch(context);
                          },
                          child: Text.rich(
                            TextSpan(
                              text: "You don't have an account! ",
                              style: TextStyle(color: SDAppTextColorSecondary),
                              children: <TextSpan>[
                                TextSpan(text: 'Sign up', style: TextStyle(color: SDColorPrimary ))
                              ]
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ).backgroundContainer(height, width),
          ],
        ),
      ),
    );
  }
}
