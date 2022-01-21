import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/app_constants/sd_constants.dart';
import 'package:s_demo/extensions/num_extension.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/screens/SDLoginScreen.dart';
import 'package:s_demo/widgets/SDCommonStyle.dart';
import 'package:s_demo/widgets/app_widget.dart';

class SDResetPasswordScreen extends StatefulWidget {
  static String tag = '/ResetPassword';

  @override
  _SDResetPasswordScreenState createState() => _SDResetPasswordScreenState();
}

class _SDResetPasswordScreenState extends State<SDResetPasswordScreen> {

  TextEditingController newPwdController = TextEditingController();
  TextEditingController conPwdController = TextEditingController();
  bool _showPwd = false;
  bool _showConPwd = false;
  FocusNode newPwdFocus = FocusNode();
  FocusNode newConPwdFocus = FocusNode();

  @override
  void dispose(){
    super.dispose();
    newPwdFocus.dispose();
    newConPwdFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            backButton(context),
            Positioned(
              top: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Reset Password', style: TextStyle(color: SDAppTextColorPrimary , fontWeight: FontWeight.bold, fontSize: 16),),
                  16.height,
                  Text('Enter the new password and confirm it', style: TextStyle(color: SDAppTextColorSecondary, fontSize: 14),),
                  16.height,
                  TextFormField(
                    controller: newPwdController,
                    focusNode: newPwdFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value){
                      FocusScope.of(context).requestFocus(newConPwdFocus);
                    },
                    obscureText: !_showPwd,
                    style: TextStyle(color: blackColor),
                    decoration: TextFormStyle.passowrdFormInputStyle("Password", _showPwd, (){
                      setState(() {
                        _showPwd = !_showPwd;
                      });
                    }),
                  ),
                  TextFormField(
                    controller: conPwdController,
                    focusNode: newConPwdFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value){
                      FocusScope.of(context).requestFocus(newConPwdFocus);
                    },
                    obscureText: !_showConPwd,
                    style: TextStyle(color: blackColor),
                    decoration: TextFormStyle.passowrdFormInputStyle("Confirm Password", _showConPwd, (){
                      setState(() {
                        _showConPwd = !_showConPwd;
                      });
                    }),
                  ),
                  20.height,
                  elevatedButton((){
                    _showDialog();
                  }, 'Send').defaultContainer(width),

                ],
              ).backgroundContainer(height, width)
            )
          ],
        ),
      ),
    );
  }
  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            actionsPadding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
            actions: [
              elevatedButton((){
                finish(context);
                finish(context);
                finish(context);
                SDLoginScreen().launch(context);
              }, 'Ok')
            ],
            content: Container(
              height: 230,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  Image.asset(SDAlertDialog, height: 100, width: 100,),
                  16.height,
                  Text(SDCongratulations, style: TextStyle(color: SDColorPrimary, fontWeight: FontWeight.bold, fontSize: 20)),
                  16.height,
                  Text(
                    SDAlertDialogTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: SDAppTextColorSecondary, fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
