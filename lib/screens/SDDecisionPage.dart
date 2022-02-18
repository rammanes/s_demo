import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:s_demo/extensions/widget_extension.dart';
import 'package:s_demo/screens/SDDashboardScreen.dart';
import 'package:s_demo/screens/SDLoginScreen.dart';


class SDDecisionPage extends StatelessWidget {
  const SDDecisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Center(
              child: Text("Something went wrong!"),
            );
          }
          else if(snapshot.hasData){
            return SDDashboardScreen();
          }else{
            return SDLoginScreen();
          }
        },
      ),
    );
  }
}
